import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/colors.dart';
import '../../constants/styles.dart';

class DateTimePickerWidget extends StatefulWidget {
  const DateTimePickerWidget({
    super.key,
    this.onChanged,
    this.borderColor = Colors.transparent,
    this.fillColor = AppColors.lightgreyContainerColor,
    this.name = "date",
    this.enable = true,
    this.initialDate,
    required this.controller,
    this.contentPadding,
    required this.hint,
    required this.validator,
    this.suffixIcon,
    this.firstDate,
    this.lastDate,
  });
  final EdgeInsetsGeometry? contentPadding;
  final void Function(DateTime?)? onChanged;
  final TextEditingController? controller;
  final Color borderColor;
  final bool enable;
  final Widget? suffixIcon;

  final String name;
  final String? initialDate;
  final Color fillColor;
  final String hint;
  final String? Function(DateTime?)? validator;
  final DateTime? firstDate;
  final DateTime? lastDate;

  @override
  State<DateTimePickerWidget> createState() => _DateTimePickerWidgetState();
}

class _DateTimePickerWidgetState extends State<DateTimePickerWidget> {
  @override
  Widget build(BuildContext context) {
    final firstDate = widget.firstDate ?? DateTime(1900);
    final lastDate = widget.lastDate ?? DateTime.now();
    final parsedInitial = (widget.initialDate?.isNotEmpty ?? false)
        ? DateTime.tryParse(widget.initialDate!)
        : null;

    DateTime pickerInitialDate = parsedInitial ?? DateTime.now();
    if (pickerInitialDate.isBefore(firstDate)) {
      pickerInitialDate = firstDate;
    }
    if (pickerInitialDate.isAfter(lastDate)) {
      pickerInitialDate = lastDate;
    }

    final fieldStyle = AppTextStyles.regular14.copyWith(
      color: AppColors.blackColor,
    );
    final hintStyle = AppTextStyles.regular14.copyWith(
      color: AppColors.greyColor,
    );

    final regular = AppTextStyles.regular14.copyWith(
      fontWeight: FontWeight.w400,
    );

    return Theme(
      data: Theme.of(context).copyWith(
        datePickerTheme: Theme.of(context).datePickerTheme.copyWith(
          dayStyle: regular,
          yearStyle: regular,
          weekdayStyle: AppTextStyles.regular12.copyWith(
            color: AppColors.greyColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      child: FormBuilderDateTimePicker(
        initialDatePickerMode: DatePickerMode.year,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        enabled: widget.enable,
        initialValue: parsedInitial,
        controller: widget.controller,
        style: fieldStyle,
        validator: widget.validator,
        inputType: InputType.date,
        fieldHintText: widget.hint,
        format: DateFormat('yyyy-MM-dd', 'en'),
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          suffixIconConstraints: BoxConstraints(
            minHeight: 10.h,
            minWidth: 10.w,
          ),
          suffixIcon: widget.suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: widget.borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: widget.borderColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(color: AppColors.redColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(color: AppColors.redColor),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: widget.borderColor),
          ),
          contentPadding:
              widget.contentPadding ??
              EdgeInsets.symmetric(vertical: 0, horizontal: 15.r),
          filled: true,
          fillColor: widget.fillColor,
          hintText: widget.hint,
          helperStyle: hintStyle,
          hintStyle: hintStyle,
          border: InputBorder.none,
        ),
        name: widget.name,
        initialDate: pickerInitialDate,
        firstDate: firstDate,
        lastDate: lastDate,
      ),
    );
  }
}
