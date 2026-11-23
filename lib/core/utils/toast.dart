import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';

myToast({m, AlignmentGeometry? align, Color color = AppColors.mainColor}) {
  BotToast.showCustomText(
    align: align ?? const Alignment(0, 0.82),
    duration: const Duration(seconds: 3),
    onlyOne: true,
    clickClose: true,
    wrapToastAnimation: (controller, cancel, child) {
      final curved = CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutCubic,
        reverseCurve: Curves.easeInCubic,
      );
      return FadeTransition(
        opacity: curved,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.35),
            end: Offset.zero,
          ).animate(curved),
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.92, end: 1.0).animate(curved),
            child: child,
          ),
        ),
      );
    },
    toastBuilder: (_) => _ProToast(message: '$m', accent: color),
  );
}

class _ProToast extends StatelessWidget {
  const _ProToast({required this.message, required this.accent});

  final String message;
  final Color accent;

  bool get _isError => accent == AppColors.redColor;
  bool get _isSuccess => accent == AppColors.secondColor;

  List<Color> get _gradient {
    if (_isError) return const [Color(0xffF87171), AppColors.redColor];
    if (_isSuccess) return const [Color(0xff6EE7B7), AppColors.secondColor];
    return const [AppColors.lightBlue, AppColors.mainColor];
  }

  IconData get _icon {
    if (_isError) return Icons.error_outline_rounded;
    if (_isSuccess) return Icons.check_rounded;
    return Icons.info_outline_rounded;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 0.86.sw),
          child: Container(
            padding: EdgeInsetsDirectional.fromSTEB(10.w, 10.h, 16.w, 10.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: _gradient.last.withValues(alpha: 0.20),
                  blurRadius: 24,
                  offset: const Offset(0, 10),
                ),
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Gradient icon badge
                Container(
                  width: 38.w,
                  height: 38.w,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: _gradient,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: _gradient.last.withValues(alpha: 0.35),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(_icon, color: Colors.white, size: 22.sp),
                ),
                SizedBox(width: 12.w),
                // Message
                Flexible(
                  child: Text(
                    message,
                    style: AppTextStyles.medium14.copyWith(
                      color: AppColors.darkBlue,
                      height: 1.35,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
