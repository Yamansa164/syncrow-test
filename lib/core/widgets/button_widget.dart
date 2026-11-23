// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:test/core/constants/colors.dart';
import 'package:test/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final Color color;
  final String? title;
  final double width;
  final double height;
  final double radius;
  final double elevation;

  final TextStyle? style;
  final Widget? icon;
  final Widget? previousIcon;

  final bool loading;
  final BorderSide? border;
  final Color loadingColor;
  final Color textColor;
  final double? paddingIcon;
  const ButtonWidget({
    super.key,
    this.color = AppColors.mainColor,
    this.loadingColor = AppColors.whiteColor,
    this.textColor = AppColors.whiteColor,

    required this.onPressed,
    this.title,
    this.width = double.infinity,
    this.loading = false,
    this.height = 40,
    this.radius = 40,
    this.icon,
    this.previousIcon,

    this.style,
    this.border,
    this.elevation = 0,
    this.paddingIcon,
  });
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,

      style: ButtonStyle(
        elevation: WidgetStateProperty.all(elevation),
        side: WidgetStateProperty.all<BorderSide>(border ?? BorderSide.none),
        backgroundColor: WidgetStateProperty.all<Color>(color),
        maximumSize: WidgetStateProperty.all(Size(width, height)),
        minimumSize: WidgetStateProperty.all(Size(width, height)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius.r)),
        ),
      ),
      child: loading
          ? SizedBox(
              height: 25.w,
              width: 25.w,
              child: CircularProgressIndicator(color: loadingColor),
            )
          : SizedBox(
              width: 200.w,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    previousIcon ?? const SizedBox(),
                    SizedBox(width: previousIcon == null ? 0 : 10.w),
                    Text(
                      title ?? "Button",
                      style:
                          style ??
                          AppTextStyles.bold18.copyWith(color: textColor),
                    ),
                    SizedBox(width: icon == null ? 0 : paddingIcon ?? 8.w),

                    icon ?? const SizedBox(),
                  ],
                ),
              ),
            ),
    );
  }
}
