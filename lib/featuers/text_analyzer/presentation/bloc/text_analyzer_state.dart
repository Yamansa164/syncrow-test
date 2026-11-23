part of 'text_analyzer_bloc.dart';

@freezed
abstract class TextAnalyzerState with _$TextAnalyzerState {
  const factory TextAnalyzerState({
    /// Stats of the last text that was analyzed successfully.
    @Default(TextStatsModel()) TextStatsModel stats,

    /// True while the field holds text that has not been analyzed yet. While
    /// it is true, [stats] describe an older text, and the panel shows them as
    /// outdated.
    @Default(false) bool loading,

    /// Set when the analysis of the current text failed. The next change to
    /// the text clears it.
    String? errorMessage,
  }) = TextAnalyzerData;
}
