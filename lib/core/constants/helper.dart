import 'package:characters/characters.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:test/core/constants/enum.dart';

/// Minimum cart total (in SYP) used only until `setting/minimum_order_value`
/// answers — the live value lives in `CartState.minOrderTotal`.
const double kFallbackMinOrderTotal = 750;

/// Localized day name for an API `day_of_week` value (1=Saturday … 7=Friday).
String formatDayName(int? dayOfWeek) {
  final day = DaysEnumExt.fromApi(dayOfWeek);
  return day != null ? day.name.tr() : '-';
}

/// Short form of [formatDayName] for the day badge — taken from the localized
/// name so it reads right in both English and Arabic.
String formatDayShortName(int? dayOfWeek) {
  final name = formatDayName(dayOfWeek);
  if (name == '-') return '--';
  return name.characters.take(3).toString();
}

/// Formats a price with thousand separators (western digits), e.g. 12500 -> "12,500".
String formatPrice(num value) => NumberFormat('#,##0', 'en').format(value);

String formatDate(String dateTime) {
  if (dateTime.isNotEmpty) {
    final date = DateTime.parse(dateTime);
    return '${date.day}/${date.month}/${date.year}';
  }
  return '';
}

/// Distance left to the customer, in meters below a kilometer and in
/// kilometers with one decimal above it — "800 م" / "1.3 كم".
String formatDistance(num meters) {
  if (meters < 1000) {
    return '${meters.round()} ${'meter_short'.tr()}';
  }
  return '${(meters / 1000).toStringAsFixed(1)} ${'km_short'.tr()}';
}

/// How stale a driver position is, from the API's `seconds_ago`.
String formatSecondsAgo(int seconds) {
  if (seconds < 60) {
    return 'updated_seconds_ago'.tr(args: ['${seconds < 0 ? 0 : seconds}']);
  }
  final minutes = seconds ~/ 60;
  if (minutes < 60) {
    return 'updated_minutes_ago'.tr(args: ['$minutes']);
  }
  return 'updated_hours_ago'.tr(args: ['${minutes ~/ 60}']);
}

String formatTime(String dateTime) {
  if (dateTime.isNotEmpty) {
    final date = DateTime.parse(dateTime);
    final hour = date.hour % 12 == 0 ? 12 : date.hour % 12;
    final period = date.hour >= 12 ? 'PM' : 'AM';
    return '$hour:${date.minute.toString().padLeft(2, '0')} $period';
  }
  return '';
}
