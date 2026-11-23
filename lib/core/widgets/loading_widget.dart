import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.isFullScreen = false});

  final bool isFullScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: isFullScreen ? 1.sh : 30.h,
        width: isFullScreen ? 1.sw : 30.w,
        child: Center(
          child: SizedBox(
            height: 30.h,
            width: 30.w,
            child: CircularProgressIndicator(color: AppColors.mainColor),
          ),
        ),
      ),
    );
  }
}
