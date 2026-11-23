import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';
import '../../data/models/text_stats_model.dart';

/// The "most frequent words" list: rank, word and how often it appears.
class TopWordsWidget extends StatelessWidget {
  const TopWordsWidget({super.key, required this.topWords});

  final List<WordFrequencyModel> topWords;

  @override
  Widget build(BuildContext context) {
    if (topWords.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Text(
          'No words yet.',
          style: AppTextStyles.regular14.copyWith(color: AppColors.greyColor),
        ),
      );
    }

    return Column(
      children: [
        for (var i = 0; i < topWords.length; i++)
          _WordRow(rank: i + 1, entry: topWords[i]),
      ],
    );
  }
}

class _WordRow extends StatelessWidget {
  const _WordRow({required this.rank, required this.entry});

  final int rank;
  final WordFrequencyModel entry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          Container(
            width: 24.w,
            height: 24.w,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.lightBlue2,
              shape: BoxShape.circle,
            ),
            child: Text(
              '$rank',
              style: AppTextStyles.bold12.copyWith(color: AppColors.mainColor),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            // A pasted URL or token can be one very long "word".
            child: Text(
              entry.word,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.regular14.copyWith(
                color: AppColors.darkBlue,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Text(
            '×${entry.count}',
            style: AppTextStyles.bold14.copyWith(color: AppColors.darkBlue),
          ),
        ],
      ),
    );
  }
}
