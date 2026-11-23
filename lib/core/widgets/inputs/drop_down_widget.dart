import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../../constants/styles.dart';

class DropDownWidget<T> extends StatelessWidget {
  const DropDownWidget({
    super.key,
    this.onChanged,
    this.enable,
    this.borderColor = AppColors.greyColor,
    required this.items,
    this.name = "dropdown",
    this.hint,
    this.initialValue,
    this.fillColor = AppColors.whiteColor,
    this.contentPadding,
    this.prefixIcon,
    this.hasValidation = true,
    this.isDense = true,
    this.itemHeight,
  });
  final EdgeInsetsGeometry? contentPadding;
  final T? initialValue;
  final Color fillColor;
  final bool? enable;
  final Color borderColor;
  final Widget? prefixIcon;
  final void Function(T?)? onChanged;
  final String name;
  final String? hint;
  final List<DropdownMenuItem<T>> items;
  final bool? hasValidation;

  /// Compresses the field height by ~half. Turn this off (`false`) for items
  /// that render on more than one line so they don't overflow the field.
  final bool isDense;

  /// Height of each menu row. Leave null to size to the item's content.
  final double? itemHeight;
  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown<T>(
      enabled: enable ?? true,
      initialValue: initialValue,
      name: name,
      isDense: isDense,
      itemHeight: itemHeight,
      style: AppTextStyles.regular14.copyWith(color: AppColors.blackColor),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: hasValidation == true
          ? (value) {
              if (value == null) {
                return "field_required".tr();
              } else {
                return null;
              }
            }
          : null,
      icon: const Icon(
        Icons.keyboard_arrow_down_outlined,
        color: AppColors.greyColor,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: borderColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: borderColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: AppColors.redColor),
        ),
        contentPadding:
            contentPadding ??
            const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        helperStyle: AppTextStyles.regular14.copyWith(
          color: AppColors.greyColor,
        ),
        hintStyle: AppTextStyles.regular14.copyWith(color: AppColors.greyColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.secondColor),
        ),
        hintText: hint,

        prefixIcon: Padding(padding: EdgeInsets.all(8.sp), child: prefixIcon),
        prefixIconConstraints: BoxConstraints(minHeight: 10.h, minWidth: 10.w),
      ),
      onChanged: onChanged,
      items: items,
    );
  }
}
