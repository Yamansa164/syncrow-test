import 'package:injectable/injectable.dart';
import '../../data/models/text_stats_model.dart';
import '../repository/text_analyzer_repository.dart';

@lazySingleton
class AnalyzeTextUsecase {
  final TextAnalyzerRepository textAnalyzerRepository;

  AnalyzeTextUsecase(this.textAnalyzerRepository);

  Future<TextStatsModel> call({required String text}) async {
    return await textAnalyzerRepository.analyze(text: text);
  }

  /// Stops the analysis in progress. Use it when its result is no longer
  /// needed, for example because the text changed or the screen closed.
  void cancel() => textAnalyzerRepository.cancel();
}
