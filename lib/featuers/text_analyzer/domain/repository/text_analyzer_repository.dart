import '../../data/models/text_stats_model.dart';

abstract class TextAnalyzerRepository {
  /// Analyzes [text] off the main isolate.
  ///
  /// Starting a new analysis cancels the one in progress.
  Future<TextStatsModel> analyze({required String text});

  /// Stops the analysis in progress, if there is one.
  void cancel();
}
