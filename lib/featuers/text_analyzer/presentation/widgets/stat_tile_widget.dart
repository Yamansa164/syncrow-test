import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';
import '../../../../core/widgets/responsive_text.dart';

/// One labelled number in the stats panel, e.g. "Words  1,204".
class StatTileWidget extends StatelessWidget {
  const StatTileWidget({super.key, required this.label, required this.value});

  final String label;
  final int value;

  static final NumberFormat _numberFormat = NumberFormat.decimalPattern('en');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: AppColors.lightBlue2,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          // Shrinks big numbers from a huge paste so they fit the tile.
          ResponsiveText(
            _numberFormat.format(value),
            style: AppTextStyles.bold20.copyWith(color: AppColors.mainColor),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 2.h),
          Text(
            label,
            style: AppTextStyles.regular12.copyWith(color: AppColors.darkBlue),
          ),
        ],
      ),
    );
  }
}
