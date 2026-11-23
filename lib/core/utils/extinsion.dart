extension ShortenTextExtension on String {
  String shorten([int maxLength = 20]) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}...';
  }
}

extension PriceFormatExtension on String {
  /// Formats a numeric price string for display, dropping redundant decimals:
  /// "1750.0" -> "1750", "1750.50" -> "1750.5", "1750" -> "1750".
  /// Returns the original string unchanged if it isn't a valid number.
  String get formattedPrice {
    final value = num.tryParse(trim());
    if (value == null) return this;
    if (value == value.roundToDouble()) return value.toInt().toString();
    return value.toString();
  }
}
