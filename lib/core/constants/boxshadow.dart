import 'package:flutter/material.dart';

class AppBoxshadow {
  static BoxShadow boxShadowBlurGreen6 = BoxShadow(
    color: const Color(0xFF007A5E).withValues(alpha: 0.16),
    offset: const Offset(0, 4),
    blurRadius: 6,
    spreadRadius: 0,
  );

  static BoxShadow boxShadowBlur6 = BoxShadow(
    color: const Color(0x00000000).withValues(alpha: 0.12),
    offset: const Offset(0, 4),
    blurRadius: 6,
    spreadRadius: 0,
  );
}
