import '../models/text_stats_model.dart';

/// How many of the most frequent words the panel lists.
const int topWordsLimit = 5;

/// A word is a run of letters, digits and combining marks, optionally joined
/// by an apostrophe:
/// * "don't" and "dog's" are one word each;
/// * Arabic words keep their diacritics (combining marks) inside the word;
/// * "!!!", "---" or "  " contain no word at all.
final RegExp _wordPattern = RegExp(
  r"[\p{L}\p{M}\p{N}]+(?:['’][\p{L}\p{M}\p{N}]+)*",
  unicode: true,
);

/// A letter in any script. Digits, diacritics, symbols and emoji are not
/// letters.
final RegExp _letterPattern = RegExp(r'\p{L}', unicode: true);

/// Spaces, tabs, line breaks and the other Unicode whitespace characters.
final RegExp _whitespacePattern = RegExp(r'\s');

/// Calculates the stats for [text].
///
/// This is the CPU-heavy part of the feature. It is pure and synchronous, and
/// it only ever runs inside the analysis isolate (see
/// `TextAnalyzerDataResource`), never on the main isolate.
///
/// Every input gives a valid result. Empty text, or text with only spaces or
/// symbols, gives zero words and an empty top-words list.
TextStatsModel calculateTextStats(String text) {
  var wordCount = 0;
  final frequencies = <String, int>{};

  for (final match in _wordPattern.allMatches(text)) {
    // "The" and "the" count as the same word.
    final word = match[0]!.toLowerCase();
    frequencies[word] = (frequencies[word] ?? 0) + 1;
    wordCount++;
  }

  return TextStatsModel(
    wordCount: wordCount,
    letterCount: _letterPattern.allMatches(text).length,
    whitespaceCount: _whitespacePattern.allMatches(text).length,
    topWords: _mostFrequentWords(frequencies),
  );
}

/// The [topWordsLimit] most frequent words, highest count first.
///
/// Words with the same count are sorted alphabetically, so the list does not
/// shuffle between two analyses of similar text.
List<WordFrequencyModel> _mostFrequentWords(Map<String, int> frequencies) {
  final entries = frequencies.entries.toList()
    ..sort((a, b) {
      final byCount = b.value.compareTo(a.value);
      return byCount != 0 ? byCount : a.key.compareTo(b.key);
    });

  return entries
      .take(topWordsLimit)
      .map((entry) => WordFrequencyModel(word: entry.key, count: entry.value))
      .toList();
}
