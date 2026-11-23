import 'package:freezed_annotation/freezed_annotation.dart';
part 'text_stats_model.freezed.dart';

/// The numbers the stats panel shows for one version of the text.
///
/// The default value (all zeros, no words) is the correct result for an empty
/// field.
@freezed
abstract class TextStatsModel with _$TextStatsModel {
  const factory TextStatsModel({
    @Default(0) int wordCount,
    @Default(0) int letterCount,
    @Default(0) int whitespaceCount,

    /// Most frequent words first, at most five of them.
    @Default([]) List<WordFrequencyModel> topWords,
  }) = _TextStatsModel;
}

/// One entry of the "most frequent words" list.
@freezed
abstract class WordFrequencyModel with _$WordFrequencyModel {
  const factory WordFrequencyModel({required String word, required int count}) =
      _WordFrequencyModel;
}
