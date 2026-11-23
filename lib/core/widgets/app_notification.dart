import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../constants/styles.dart';

/// Visual variants of [AppNotification].
enum AppNotificationType { success, error }

/// A polished, animated notification banner used for app-wide success / error
/// messages.
///
/// Features a slide + fade entrance, a gradient accent bar, a gradient icon
/// badge, and a thin progress line that depletes over the toast's lifetime.
/// Pass [type] to switch between the green success and red error palettes.
class AppNotification extends StatefulWidget {
  const AppNotification({
    super.key,
    required this.message,
    required this.onClose,
    this.type = AppNotificationType.error,
    this.duration = const Duration(seconds: 3),
  });

  final String message;
  final VoidCallback onClose;
  final AppNotificationType type;
  final Duration duration;

  @override
  State<AppNotification> createState() => _AppNotificationState();
}

class _AppNotificationState extends State<AppNotification>
    with TickerProviderStateMixin {
  late final AnimationController _entry;
  late final AnimationController _progress;

  @override
  void initState() {
    super.initState();
    _entry = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 420),
    )..forward();
    _progress = AnimationController(vsync: this, duration: widget.duration)
      ..forward();
  }

  @override
  void dispose() {
    _entry.dispose();
    _progress.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final curved = CurvedAnimation(parent: _entry, curve: Curves.easeOutBack);

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 0),
        child: Material(
          color: Colors.transparent,
          child: FadeTransition(
            opacity: _entry,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, -0.5),
                end: Offset.zero,
              ).animate(curved),
              child: ScaleTransition(
                scale: Tween<double>(begin: 0.92, end: 1.0).animate(curved),
                alignment: Alignment.topCenter,
                child: _NotificationCard(
                  type: widget.type,
                  message: widget.message,
                  progress: _progress,
                  onClose: widget.onClose,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// The toast card itself: accent icon, message, close button and the countdown
/// bar that drains while it is on screen.
class _NotificationCard extends StatelessWidget {
  const _NotificationCard({
    required this.type,
    required this.message,
    required this.progress,
    required this.onClose,
  });

  static const _redGradient = [Color(0xffF87171), AppColors.redColor];
  static const _greenGradient = [Color(0xff6EE7B7), AppColors.secondColor];

  final AppNotificationType type;
  final String message;
  final Animation<double> progress;
  final VoidCallback? onClose;

  bool get _isSuccess => type == AppNotificationType.success;

  List<Color> get _gradient => _isSuccess ? _greenGradient : _redGradient;

  Color get _accent => _isSuccess ? AppColors.secondColor : AppColors.redColor;

  IconData get _icon =>
      _isSuccess ? Icons.check_rounded : Icons.priority_high_rounded;

  String get _title => _isSuccess ? 'success'.tr() : 'error'.tr();

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: _accent.withValues(alpha: 0.14),
            blurRadius: 22,
            spreadRadius: 0,
            offset: const Offset(0, 10),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Leading gradient accent bar
                Container(
                  width: 5.w,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: _gradient,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
                    child: Row(
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
                                color: _accent.withValues(alpha: 0.35),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Icon(_icon, color: Colors.white, size: 22.sp),
                        ),
                        SizedBox(width: 12.w),
                        // Texts
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                _title,
                                style: AppTextStyles.bold14.copyWith(
                                  color: AppColors.darkBlue,
                                ),
                              ),
                              SizedBox(height: 3.h),
                              Text(
                                message,
                                style: AppTextStyles.regular12.copyWith(
                                  color: AppColors.greyColor,
                                  height: 1.35,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8.w),
                        // Close
                        GestureDetector(
                          onTap: onClose,
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                            width: 24.w,
                            height: 24.w,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: AppColors.lightgreyContainerColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.close_rounded,
                              color: AppColors.greyColor,
                              size: 15.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Depleting countdown line
          AnimatedBuilder(
            animation: progress,
            builder: (context, _) {
              return Align(
                alignment: AlignmentDirectional.centerStart,
                child: FractionallySizedBox(
                  widthFactor: 1.0 - progress.value,
                  child: Container(
                    height: 3.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: _gradient),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
