import 'dart:async';
import 'dart:isolate';

import '../models/text_stats_model.dart';
import 'text_analysis_exceptions.dart';
import 'text_stats_calculator.dart';

/// The work that runs inside the analysis isolate.
typedef TextStatsCalculator = TextStatsModel Function(String text);

/// The `debugName` of every analysis isolate. It makes the isolate easy to
/// spot in DevTools, and tests use it to check where the work ran.
const String analysisIsolateName = 'TextAnalyzer';

/// Runs the text analysis off the main isolate.
///
/// Each analysis gets a fresh isolate created with [Isolate.spawn]. This is
/// what [Isolate.run] does too, but [Isolate.run] does not return the
/// [Isolate], so a run that is no longer needed cannot be stopped. Keeping the
/// handle gives two things:
/// * **Cancellation.** When the text changes, the running analysis is killed.
///   On a very large text, a stale analysis would otherwise keep a CPU core
///   busy for nothing.
/// * **Crash recovery.** If an isolate fails, the next analysis spawns a new
///   one. There is no long-lived worker that needs restarting.
///
/// Only one analysis runs at a time. Starting a new one cancels the previous
/// one.
class TextAnalyzerDataResource {
  TextAnalyzerDataResource({this.calculate = calculateTextStats});

  /// What runs inside the isolate. The app uses the default; tests replace it
  /// with a function that throws or kills its isolate.
  ///
  /// It is sent to the isolate, so it must be a top-level or static function,
  /// or a closure that captures only sendable values.
  final TextStatsCalculator calculate;

  _AnalysisJob? _currentJob;

  /// Analyzes [text] in a new isolate.
  ///
  /// The future throws [TextAnalysisException] if the isolate fails, and
  /// [TextAnalysisCancelledException] if [cancel] or a newer [analyze] call
  /// stops this one first.
  Future<TextStatsModel> analyze(String text) async {
    cancel();

    final job = _AnalysisJob(text: text, calculate: calculate);
    _currentJob = job;
    try {
      return await job.result;
    } finally {
      if (identical(_currentJob, job)) _currentJob = null;
    }
  }

  /// Kills the running analysis, if there is one.
  void cancel() {
    _currentJob?.cancel();
    _currentJob = null;
  }
}

/// One analysis that runs in one isolate.
///
/// The isolate reports back on a single port, the same way [Isolate.run]
/// does:
/// * a [TextStatsModel]: the analysis finished;
/// * a two-item `List` `[error, stackTrace]`: the analysis threw (this comes
///   from the `onError` port);
/// * `null`: the isolate exited (this comes from the `onExit` port). If no
///   result arrived first, the isolate died partway through.
class _AnalysisJob {
  _AnalysisJob({required String text, required TextStatsCalculator calculate}) {
    _port.handler = _onMessage;
    unawaited(_start(text, calculate));
  }

  final RawReceivePort _port = RawReceivePort();
  final Completer<TextStatsModel> _completer = Completer<TextStatsModel>();
  Isolate? _isolate;

  Future<TextStatsModel> get result => _completer.future;

  Future<void> _start(String text, TextStatsCalculator calculate) async {
    try {
      final isolate = await Isolate.spawn(
        _analyzeInIsolate,
        (replyPort: _port.sendPort, text: text, calculate: calculate),
        onError: _port.sendPort,
        onExit: _port.sendPort,
        debugName: analysisIsolateName,
      );

      if (_completer.isCompleted) {
        // The job was cancelled while the isolate was still starting.
        isolate.kill(priority: Isolate.immediate);
      } else {
        _isolate = isolate;
      }
    } catch (error, stackTrace) {
      _fail(
        TextAnalysisException('could not start the analysis isolate ($error)'),
        stackTrace,
      );
    }
  }

  void cancel() {
    _isolate?.kill(priority: Isolate.immediate);
    _fail(TextAnalysisCancelledException());
  }

  void _onMessage(Object? message) {
    switch (message) {
      case TextStatsModel stats:
        _succeed(stats);
      case [final error, final stackTrace]:
        _fail(
          TextAnalysisException('$error'),
          StackTrace.fromString('$stackTrace'),
        );
      case null:
        _fail(TextAnalysisException('the isolate stopped before replying'));
    }
  }

  void _succeed(TextStatsModel stats) {
    if (_completer.isCompleted) return;
    _port.close();
    _completer.complete(stats);
  }

  void _fail(Object error, [StackTrace? stackTrace]) {
    if (_completer.isCompleted) return;
    _port.close();
    _completer.completeError(error, stackTrace);
  }
}

/// Entry point of the analysis isolate. [Isolate.spawn] requires it to be a
/// top-level function.
void _analyzeInIsolate(
  ({SendPort replyPort, String text, TextStatsCalculator calculate}) request,
) {
  // Isolate.exit passes the result to the main isolate without copying it.
  Isolate.exit(request.replyPort, request.calculate(request.text));
}
