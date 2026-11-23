import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:injectable/injectable.dart';
import '../../../../core/utils/bloc_transformers.dart';
import '../../data/datasource/text_analysis_exceptions.dart';
import '../../data/models/text_stats_model.dart';

import '../../domain/usecase/analyze_text_usecase.dart';

part 'text_analyzer_event.dart';
part 'text_analyzer_state.dart';
part 'text_analyzer_bloc.freezed.dart';

/// Keeps the stats panel in sync with the text field.
///
/// Each event has its own handler, with the transformer that fits it:
/// * `textChangedEvent` and `retryEvent` come from the UI and run
///   **immediately**. They update the panel right away, then ask for an
///   analysis.
/// * `analyzeEvent` runs through [debounceRestartable]. It waits for a pause
///   in typing, and a newer request cancels an older one.
///
/// `textChangedEvent` itself is not debounced on purpose. If it were, the bloc
/// would not learn about a keystroke for 300 ms. During that window the old
/// stats would look current, and a late result for the old text would be
/// shown.
@injectable
class TextAnalyzerBloc extends Bloc<TextAnalyzerEvent, TextAnalyzerState> {
  final AnalyzeTextUsecase analyzeTextUsecase;

  TextAnalyzerBloc({required this.analyzeTextUsecase})
    : super(const TextAnalyzerData()) {
    on<_TextChangedEvent>(_onTextChanged);
    on<_RetryEvent>(_onRetry);
    on<_AnalyzeEvent>(
      _onAnalyze,
      transformer: debounceRestartable(debounceDuration),
    );
  }

  static const String analysisFailedMessage =
      'Analysis failed. Keep typing or tap retry to try again.';

  /// How long typing must pause before the text is analyzed.
  static const Duration debounceDuration = Duration(milliseconds: 300);

  /// The text currently in the field.
  String _text = '';

  void _onTextChanged(
    _TextChangedEvent event,
    Emitter<TextAnalyzerState> emit,
  ) {
    _text = event.text;

    // Any isolate still running is analyzing an older text, so stop it now.
    analyzeTextUsecase.cancel();

    _requestAnalysis(emit);
  }

  void _onRetry(_RetryEvent event, Emitter<TextAnalyzerState> emit) {
    _requestAnalysis(emit);
  }

  /// Shows the panel as updating right away, and asks for a debounced analysis
  /// of the current text.
  ///
  /// The old stats stay visible, faded, until the new result arrives. Emitting
  /// an identical state is a no-op, so while the user keeps typing this
  /// rebuilds nothing.
  void _requestAnalysis(Emitter<TextAnalyzerState> emit) {
    emit(state.copyWith(loading: true, errorMessage: null));
    add(const TextAnalyzerEvent.analyzeEvent());
  }

  Future<void> _onAnalyze(
    _AnalyzeEvent event,
    Emitter<TextAnalyzerState> emit,
  ) async {
    final text = _text;

    try {
      final stats = await analyzeTextUsecase(text: text);
      if (_isOutdated(text, emit)) return;

      emit(state.copyWith(stats: stats, loading: false));
    } catch (error, stackTrace) {
      // A cancelled analysis was replaced on purpose. It is not a failure.
      if (error is TextAnalysisCancelledException) return;
      if (_isOutdated(text, emit)) return;

      addError(error, stackTrace);
      emit(state.copyWith(loading: false, errorMessage: analysisFailedMessage));
    }
  }

  /// Whether the result for [analyzedText] must not be shown. There are two
  /// cases:
  /// * A newer analysis replaced this one (restartable cancelled it), so
  ///   `emit.isDone` is true.
  /// * The field changed while this analysis ran, and the next analysis is
  ///   still in its debounce wait, so restartable has not cancelled this one
  ///   yet.
  bool _isOutdated(String analyzedText, Emitter<TextAnalyzerState> emit) {
    return emit.isDone || analyzedText != _text;
  }

  @override
  Future<void> close() {
    analyzeTextUsecase.cancel();
    return super.close();
  }
}
