part of 'text_analyzer_bloc.dart';

@freezed
abstract class TextAnalyzerEvent with _$TextAnalyzerEvent {
  /// The text in the field changed. Sent by the UI on every keystroke and
  /// paste.
  const factory TextAnalyzerEvent.textChangedEvent({required String text}) =
      _TextChangedEvent;

  /// The analysis failed and the user tapped retry. Sent by the UI.
  const factory TextAnalyzerEvent.retryEvent() = _RetryEvent;

  /// Analyze the current text. Sent only by the bloc itself. It is debounced
  /// and restartable.
  const factory TextAnalyzerEvent.analyzeEvent() = _AnalyzeEvent;
}
