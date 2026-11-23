import 'package:test/core/utils/app_regx.dart';
import 'package:easy_localization/easy_localization.dart';

class Validator {
  /// Local numbers are written as `09XXXXXXXX`.
  static const int phoneLength = 10;

  /// The number must be typed in full; anything shorter or missing the leading
  /// zero leaves us unable to call the customer back.
  static String? validatePhone({String? phone}) {
    final value = (phone ?? '').trim();
    if (value.isEmpty) {
      return "field_required".tr();
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return "phone_digits_only".tr();
    }
    if (!value.startsWith('0')) {
      return "phone_starts_with_zero".tr();
    }
    if (value.length != phoneLength) {
      return "phone_exact_length".tr();
    }
    return null;
  }

  static String? validateEmail({String? email}) {
    if (email!.isEmpty) {
      return "email_required".tr();
    } else if (!AppRegex.isEmailValid(email)) {
      return "valid_email".tr();
    }
    return null;
  }

  // Validation function for password
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "field_required".tr();
    }
    if (value.length < 8) {
      return 'min_char'.tr();
    }

    return null; // Return null if validation passes
  }

  // Validation functions
  static String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return "field_required".tr();
    }
    if (!RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$').hasMatch(value)) {
      return 'only_letters'.tr();
    }
    return null;
  }

  static String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return "field_required".tr();
    }
    if (!RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$').hasMatch(value)) {
      return 'only_letters'.tr();
    }
    return null;
  }

  static String? validateBirthDate({DateTime? value}) {
    if (value == null) {
      return "field_required".tr();
    }
    return null;
  }

  static String? validateFieldRequierd(String? value) {
    if (value == null || value.isEmpty) {
      return "field_required".tr();
    }

    return null;
  }

  static String? validateConfirmPassword({
    String? firstpass,
    String? secondpass,
  }) {
    if (firstpass == null || firstpass.isEmpty) {
      return "field_required".tr();
    }
    if (firstpass != secondpass) {
      return 'password_does_not_match'.tr();
    }
    return null;
  }
}
