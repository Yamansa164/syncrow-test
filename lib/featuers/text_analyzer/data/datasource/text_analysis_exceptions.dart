import '../../../../core/api/exceptions.dart';

/// The analysis isolate failed. Either the analysis threw, the isolate died
/// before it sent a result, or the isolate could not be started.
class TextAnalysisException extends AppException {
  TextAnalysisException([String? message])
    : super(message, 'Text analysis failed: ');
}

/// The analysis was stopped on purpose because a newer text replaced it, so
/// its result is no longer needed.
class TextAnalysisCancelledException extends AppException {
  TextAnalysisCancelledException()
    : super('a newer analysis replaced this one', 'Text analysis cancelled: ');
}
