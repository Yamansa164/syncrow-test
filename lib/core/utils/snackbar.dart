import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:test/core/widgets/app_notification.dart';

/// Shows the polished [AppNotification] banner in its green success variant.
void successSnackBar({required String? message}) {
  const toastDuration = Duration(seconds: 3);
  BotToast.showCustomNotification(
    align: Alignment.bottomCenter,
    duration: toastDuration,
    animationDuration: const Duration(milliseconds: 300),
    toastBuilder: (cancelFunc) {
      return AppNotification(
        message: message ?? '',
        onClose: cancelFunc,
        type: AppNotificationType.success,
        duration: toastDuration,
      );
    },
  );
}
