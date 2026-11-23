import 'package:flutter/material.dart';

/// Text that shrinks its font size until it fits [maxLines] inside the
/// available width, instead of ellipsizing right away.
///
/// Useful for product names, which vary a lot in length: short names keep the
/// designed size while long ones scale down (never below [minFontSize]) so the
/// whole name stays readable. If even [minFontSize] does not fit, it falls back
/// to an ellipsis.
class ResponsiveText extends StatelessWidget {
  const ResponsiveText(
    this.text, {
    super.key,
    required this.style,
    this.maxLines = 1,
    this.minFontSize = 9,
    this.textAlign,
  });

  final String text;
  final TextStyle style;
  final int maxLines;
  final double minFontSize;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        var fontSize = style.fontSize ?? 14;

        if (maxWidth.isFinite && text.isNotEmpty) {
          final direction = Directionality.of(context);
          final scaler = MediaQuery.textScalerOf(context);

          bool fits(double size) {
            final painter = TextPainter(
              text: TextSpan(
                text: text,
                style: style.copyWith(fontSize: size),
              ),
              maxLines: maxLines,
              textDirection: direction,
              textAlign: textAlign ?? TextAlign.start,
              textScaler: scaler,
            )..layout(maxWidth: maxWidth);
            return !painter.didExceedMaxLines;
          }

          while (fontSize > minFontSize && !fits(fontSize)) {
            fontSize -= 0.5;
          }
          if (fontSize < minFontSize) fontSize = minFontSize;
        }

        return Text(
          text,
          style: style.copyWith(fontSize: fontSize),
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          textAlign: textAlign,
        );
      },
    );
  }
}
