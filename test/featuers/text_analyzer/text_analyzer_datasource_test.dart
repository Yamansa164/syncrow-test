import 'dart:isolate';

import 'package:flutter_test/flutter_test.dart';
import 'package:test/featuers/text_analyzer/data/datasource/text_analysis_exceptions.dart';
import 'package:test/featuers/text_analyzer/data/datasource/text_analyzer_datasource.dart';
import 'package:test/featuers/text_analyzer/data/datasource/text_stats_calculator.dart';
import 'package:test/featuers/text_analyzer/data/models/text_stats_model.dart';

/// Reports the name of the isolate it runs in, as the only "word".
TextStatsModel _reportIsolateName(String text) => TextStatsModel(
  topWords: [
    WordFrequencyModel(word: Isolate.current.debugName ?? '', count: 1),
  ],
);

/// Throws for the text "crash", analyzes anything else normally.
TextStatsModel _throwOnCrash(String text) {
  if (text == 'crash') throw StateError('analysis blew up');
  return calculateTextStats(text);
}

/// Kills its own isolate for the text "die", so no result or error is sent.
TextStatsModel _dieOnDie(String text) {
  if (text == 'die') Isolate.current.kill(priority: Isolate.immediate);
  return calculateTextStats(text);
}

/// Takes long enough that a second request starts while it is still running.
TextStatsModel _slow(String text) {
  final stopwatch = Stopwatch()..start();
  while (stopwatch.elapsedMilliseconds < 300) {}
  return calculateTextStats(text);
}

void main() {
  group('TextAnalyzerDataResource', () {
    test('analyzes the text', () async {
      final stats = await TextAnalyzerDataResource().analyze('one two two');

      expect(stats.wordCount, 3);
      expect(
        stats.topWords.first,
        const WordFrequencyModel(word: 'two', count: 2),
      );
    });

    // AC 3: the analysis runs off the main isolate.
    test('runs the analysis in a separate isolate', () async {
      final dataResource = TextAnalyzerDataResource(
        calculate: _reportIsolateName,
      );

      final stats = await dataResource.analyze('anything');

      expect(stats.topWords.single.word, analysisIsolateName);
      expect(Isolate.current.debugName, isNot(analysisIsolateName));
    });

    // AC 6: a failing isolate is reported, and the next analysis works.
    test('reports an error thrown in the isolate and recovers', () async {
      final dataResource = TextAnalyzerDataResource(calculate: _throwOnCrash);

      await expectLater(
        dataResource.analyze('crash'),
        throwsA(isA<TextAnalysisException>()),
      );
      expect((await dataResource.analyze('works again')).wordCount, 2);
    });

    test(
      'reports an isolate that dies without replying and recovers',
      () async {
        final dataResource = TextAnalyzerDataResource(calculate: _dieOnDie);

        await expectLater(
          dataResource.analyze('die'),
          throwsA(isA<TextAnalysisException>()),
        );
        expect((await dataResource.analyze('works again')).wordCount, 2);
      },
    );

    test('a new analysis cancels the one in progress', () async {
      final dataResource = TextAnalyzerDataResource(calculate: _slow);

      final first = dataResource.analyze('old text');
      final second = dataResource.analyze('the new text');

      await expectLater(first, throwsA(isA<TextAnalysisCancelledException>()));
      expect((await second).wordCount, 3);
    });

    test('cancel stops the analysis in progress', () async {
      final dataResource = TextAnalyzerDataResource(calculate: _slow);

      final analysis = dataResource.analyze('some text');
      dataResource.cancel();

      await expectLater(
        analysis,
        throwsA(isA<TextAnalysisCancelledException>()),
      );
    });
  });
}
