import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/colors.dart';
import '../../constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    this.name = "text",
    this.fillColor = Colors.white,
    this.borderColor = AppColors.greyColor,
    this.hint,
    this.maxLength,
    this.enable = true,
    this.isPassword = false,
    this.visible = true,
    this.maxLines = 1,
    this.prefix,
    this.suffixIcon,
    this.isRequired = true,
    this.prefixIcon,
    this.keyboardType,
    this.inputFormatters,
    required this.controller,
    this.validator,
    this.contentPadding,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.focusNode,
    this.initialValue,
    this.helperText,
    this.boxShadow,
    this.hasTextError = true,
    this.suffix,
    this.hintStyle,
    this.hintWidget,
    this.style,
  });
  final String name;
  final String? initialValue;
  final FocusNode? focusNode;
  final Widget? hintWidget;

  final Color fillColor;
  final Color borderColor;
  final String? hint;
  final String? helperText;

  final int? maxLength;
  final bool enable;
  final bool isPassword;
  final bool visible;
  final bool isRequired;
  final int? maxLines;
  final Widget? prefix;
  final Widget? suffixIcon;
  final Widget? suffix;
  final TextStyle? hintStyle;
  final TextStyle? style;

  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry? contentPadding;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSubmitted;
  final void Function()? onTap;
  final BoxShadow? boxShadow;
  final bool hasTextError;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  //
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: widget.boxShadow == null ? [] : [?widget.boxShadow],
      ),
      child: FormBuilderTextField(
        errorBuilder: (context, errorText) {
          return widget.hasTextError == true
              ? Text(
                  errorText,
                  style: AppTextStyles.regular12.copyWith(
                    color: AppColors.redColor,
                    fontSize: 10.sp,
                  ),
                )
              : SizedBox();
        },

        initialValue: widget.initialValue,
        enabled: widget.enable,
        focusNode: widget.focusNode ?? _focusNode,
        name: widget.name,
        controller: widget.controller,
        obscureText: !widget.visible,

        textInputAction: TextInputAction.done,
        enableSuggestions: !widget.isPassword,
        autocorrect: !widget.isPassword,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        onTap: widget.onTap,
        keyboardType: widget.keyboardType,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        inputFormatters: widget.inputFormatters,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validator,
        style:
            widget.style ??
            AppTextStyles.regular14.copyWith(fontWeight: FontWeight.w300),
        onEditingComplete: () {
          // This callback is triggered when the user presses "OK" on the keyboard
          _focusNode.unfocus(); // Close the keyboard
          widget.focusNode?.unfocus();
        },
        decoration: InputDecoration(
          prefix: widget.prefix,
          suffixIcon: widget.suffixIcon,
          suffix: widget.suffix,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: widget.prefixIcon,
          ),
          prefixIconConstraints: BoxConstraints(
            minHeight: 10.h,
            minWidth: 10.w,
          ),
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
            borderSide: const BorderSide(color: Colors.red),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(color: Colors.red),
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
          hint: widget.hintWidget,
          helperStyle: AppTextStyles.regular16.copyWith(
            color: AppColors.mainColor,
          ),

          hintStyle:
              widget.hintStyle ??
              AppTextStyles.regular14.copyWith(color: AppColors.greyColor),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
