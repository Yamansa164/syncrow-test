import 'package:flutter_test/flutter_test.dart';
import 'package:test/featuers/text_analyzer/data/datasource/text_stats_calculator.dart';
import 'package:test/featuers/text_analyzer/data/models/text_stats_model.dart';

void main() {
  group('calculateTextStats', () {
    // AC 7: empty, spaces only, symbols only -> valid results, no error.
    test('empty text gives all zeros', () {
      expect(calculateTextStats(''), const TextStatsModel());
    });

    test('only whitespace counts whitespace and nothing else', () {
      final stats = calculateTextStats('  \n\t \r\n');

      expect(stats.wordCount, 0);
      expect(stats.letterCount, 0);
      expect(stats.whitespaceCount, 7);
      expect(stats.topWords, isEmpty);
    });

    test('only symbols gives no words and no letters', () {
      final stats = calculateTextStats(r'!@#$%^&*() -- ... ?! 🙂');

      expect(stats.wordCount, 0);
      expect(stats.letterCount, 0);
      expect(stats.whitespaceCount, 4);
      expect(stats.topWords, isEmpty);
    });

    // AC 2: word count, letter count, whitespace count, top five words.
    test('counts words, letters and whitespace in a sentence', () {
      final stats = calculateTextStats('The cat and the hat.');

      expect(stats.wordCount, 5);
      expect(stats.letterCount, 15);
      expect(stats.whitespaceCount, 4);
      expect(stats.topWords, const [
        WordFrequencyModel(word: 'the', count: 2),
        WordFrequencyModel(word: 'and', count: 1),
        WordFrequencyModel(word: 'cat', count: 1),
        WordFrequencyModel(word: 'hat', count: 1),
      ]);
    });

    test('counts words case-insensitively', () {
      final stats = calculateTextStats('Hello HELLO hello');

      expect(stats.topWords, const [
        WordFrequencyModel(word: 'hello', count: 3),
      ]);
    });

    test('lists at most five words, ties sorted alphabetically', () {
      final stats = calculateTextStats('f e d c b a a b');

      expect(stats.topWords.map((w) => w.word), ['a', 'b', 'c', 'd', 'e']);
    });

    test('numbers are words but not letters', () {
      final stats = calculateTextStats('Room 101');

      expect(stats.wordCount, 2);
      expect(stats.letterCount, 4);
    });

    test('keeps contractions together as one word', () {
      final stats = calculateTextStats("don't stop, don't");

      expect(stats.wordCount, 3);
      expect(
        stats.topWords.first,
        const WordFrequencyModel(word: "don't", count: 2),
      );
    });

    test('handles Arabic, counting diacritics as part of the word only', () {
      // "مَرْحَبًا" = 5 letters + 4 diacritics, "بالعالم" = 7 letters.
      final stats = calculateTextStats('مَرْحَبًا بالعالم');

      expect(stats.wordCount, 2);
      expect(stats.letterCount, 12);
      expect(stats.whitespaceCount, 1);
    });
  });
}
