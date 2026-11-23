import 'package:injectable/injectable.dart';
import '../datasource/text_analyzer_datasource.dart';

import '../models/text_stats_model.dart';
import '../../domain/repository/text_analyzer_repository.dart';

@LazySingleton(as: TextAnalyzerRepository)
class TextAnalyzerRepositoryImp implements TextAnalyzerRepository {
  final TextAnalyzerDataResource textAnalyzerDataResource;
  TextAnalyzerRepositoryImp(this.textAnalyzerDataResource);

  @override
  Future<TextStatsModel> analyze({required String text}) {
    return textAnalyzerDataResource.analyze(text);
  }

  @override
  void cancel() => textAnalyzerDataResource.cancel();
}
