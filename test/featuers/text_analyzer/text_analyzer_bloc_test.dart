import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:test/featuers/text_analyzer/data/datasource/text_analysis_exceptions.dart';
import 'package:test/featuers/text_analyzer/data/models/text_stats_model.dart';
import 'package:test/featuers/text_analyzer/domain/repository/text_analyzer_repository.dart';
import 'package:test/featuers/text_analyzer/domain/usecase/analyze_text_usecase.dart';
import 'package:test/featuers/text_analyzer/presentation/bloc/text_analyzer_bloc.dart';

/// A repository whose analyses finish only when the test completes them, in
/// whatever order the test chooses.
class _FakeTextAnalyzerRepository implements TextAnalyzerRepository {
  final List<({String text, Completer<TextStatsModel> completer})> requests =
      [];

  @override
  Future<TextStatsModel> analyze({required String text}) {
    final completer = Completer<TextStatsModel>();
    requests.add((text: text, completer: completer));
    return completer.future;
  }

  /// Does nothing on purpose. It acts as if the kill lost the race, so the
  /// old result still arrives and the bloc has to throw it away itself.
  @override
  void cancel() {}
}

/// Longer than the bloc's 300 ms debounce.
Future<void> _waitForDebounce() =>
    Future<void>.delayed(const Duration(milliseconds: 400));

/// Lets the bloc handle whatever has just completed.
Future<void> _settle() =>
    Future<void>.delayed(const Duration(milliseconds: 10));

void main() {
  late _FakeTextAnalyzerRepository repository;
  late TextAnalyzerBloc bloc;

  setUp(() {
    repository = _FakeTextAnalyzerRepository();
    bloc = TextAnalyzerBloc(analyzeTextUsecase: AnalyzeTextUsecase(repository));
  });

  tearDown(() => bloc.close());

  void type(String text) =>
      bloc.add(TextAnalyzerEvent.textChangedEvent(text: text));

  test('starts with valid empty stats', () {
    expect(bloc.state, const TextAnalyzerState());
  });

  // AC 4: typing fast does not start an analysis per keystroke.
  test('analyzes once typing pauses, with the latest text', () async {
    type('h');
    type('he');
    type('hello');
    await _settle();
    expect(bloc.state.loading, isTrue);
    expect(repository.requests, isEmpty);

    await _waitForDebounce();
    expect(repository.requests.map((r) => r.text), ['hello']);
  });

  // AC 5: results for an older text are never shown.
  test('ignores an old result that arrives during the debounce wait', () async {
    type('old');
    await _waitForDebounce();
    type('new text');
    await _settle();

    // "new text" is still waiting for the debounce when "old" finishes.
    repository.requests[0].completer.complete(
      const TextStatsModel(wordCount: 1),
    );
    await _settle();
    expect(bloc.state.stats, const TextStatsModel());
    expect(bloc.state.loading, isTrue);

    await _waitForDebounce();
    expect(repository.requests.map((r) => r.text), ['old', 'new text']);
    repository.requests[1].completer.complete(
      const TextStatsModel(wordCount: 2),
    );
    await _settle();
    expect(
      bloc.state,
      const TextAnalyzerState(stats: TextStatsModel(wordCount: 2)),
    );
  });

  test(
    'ignores an old result that arrives after the new analysis started',
    () async {
      type('old');
      await _waitForDebounce();
      type('new text');
      await _waitForDebounce();
      expect(repository.requests.map((r) => r.text), ['old', 'new text']);

      // The analysis of "old" finishes after the text changed: drop it.
      repository.requests[0].completer.complete(
        const TextStatsModel(wordCount: 1),
      );
      await _settle();
      expect(bloc.state.stats, const TextStatsModel());
      expect(bloc.state.loading, isTrue);

      repository.requests[1].completer.complete(
        const TextStatsModel(wordCount: 2),
      );
      await _settle();
      expect(
        bloc.state,
        const TextAnalyzerState(stats: TextStatsModel(wordCount: 2)),
      );
    },
  );

  // AC 6: the user is told, and the next change analyzes again.
  test('shows a failure, then recovers on the next change', () async {
    type('crash');
    await _waitForDebounce();
    repository.requests[0].completer.completeError(
      TextAnalysisException('boom'),
    );
    await _settle();
    expect(bloc.state.errorMessage, TextAnalyzerBloc.analysisFailedMessage);
    expect(bloc.state.loading, isFalse);

    type('fine');
    await _settle();
    expect(bloc.state.errorMessage, isNull);

    await _waitForDebounce();
    repository.requests[1].completer.complete(
      const TextStatsModel(wordCount: 1),
    );
    await _settle();
    expect(
      bloc.state,
      const TextAnalyzerState(stats: TextStatsModel(wordCount: 1)),
    );
  });

  test('retry analyzes the same text again', () async {
    type('crash');
    await _waitForDebounce();
    repository.requests[0].completer.completeError(
      TextAnalysisException('boom'),
    );
    await _settle();

    bloc.add(const TextAnalyzerEvent.retryEvent());
    await _settle();
    // Immediate feedback: the error is gone before the debounce ends.
    expect(bloc.state.errorMessage, isNull);
    expect(bloc.state.loading, isTrue);

    await _waitForDebounce();
    expect(repository.requests.map((r) => r.text), ['crash', 'crash']);
  });

  test('a cancelled analysis is never shown as a failure', () async {
    type('text');
    await _waitForDebounce();
    repository.requests[0].completer.completeError(
      TextAnalysisCancelledException(),
    );
    await _settle();

    expect(bloc.state.errorMessage, isNull);
  });

  test('typing during a retry cancels the retry', () async {
    type('crash');
    await _waitForDebounce();
    repository.requests[0].completer.completeError(
      TextAnalysisException('boom'),
    );
    await _settle();
    bloc.add(const TextAnalyzerEvent.retryEvent());
    await _waitForDebounce();

    type('crash fixed');
    await _settle();
    // The retry fails late, but the user has already moved on.
    repository.requests[1].completer.completeError(
      TextAnalysisException('boom again'),
    );
    await _settle();
    expect(bloc.state.errorMessage, isNull);
    expect(bloc.state.loading, isTrue);
  });
}
