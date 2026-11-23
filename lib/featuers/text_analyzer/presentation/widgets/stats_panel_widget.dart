import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/boxshadow.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';
import '../../data/models/text_stats_model.dart';
import '../bloc/text_analyzer_bloc.dart';
import 'stat_tile_widget.dart';
import 'top_words_widget.dart';

/// The panel under the text field. It is the only widget that rebuilds when
/// the analyzer state changes. The text field never rebuilds because of it.
class StatsPanelWidget extends StatelessWidget {
  const StatsPanelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextAnalyzerBloc, TextAnalyzerState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(18.r),
            boxShadow: [AppBoxshadow.boxShadowBlur6],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _PanelHeader(loading: state.loading),
              SizedBox(height: 12.h),
              if (state.errorMessage != null)
                _AnalysisErrorWidget(message: state.errorMessage!)
              else
                // Outdated stats stay visible but faded. The panel does not
                // flicker on every keystroke, and old numbers are never shown
                // as if they were current.
                AnimatedOpacity(
                  opacity: state.loading ? 0.4 : 1,
                  duration: const Duration(milliseconds: 150),
                  child: _StatsContent(stats: state.stats),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _PanelHeader extends StatelessWidget {
  const _PanelHeader({required this.loading});

  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Statistics',
            style: AppTextStyles.bold16.copyWith(color: AppColors.darkBlue),
          ),
        ),
        if (loading) ...[
          SizedBox(
            width: 14.w,
            height: 14.w,
            child: const CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.mainColor,
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            'Analyzing…',
            style: AppTextStyles.regular12.copyWith(color: AppColors.greyColor),
          ),
        ],
      ],
    );
  }
}

class _StatsContent extends StatelessWidget {
  const _StatsContent({required this.stats});

  final TextStatsModel stats;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: StatTileWidget(label: 'Words', value: stats.wordCount),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: StatTileWidget(label: 'Letters', value: stats.letterCount),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: StatTileWidget(
                label: 'Whitespace',
                value: stats.whitespaceCount,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Text(
          'Most frequent words',
          style: AppTextStyles.bold14.copyWith(color: AppColors.darkBlue),
        ),
        SizedBox(height: 4.h),
        TopWordsWidget(topWords: stats.topWords),
      ],
    );
  }
}

/// Tells the user that the analysis failed. Typing anything starts a new
/// analysis on its own; retry runs it again for the same text.
class _AnalysisErrorWidget extends StatelessWidget {
  const _AnalysisErrorWidget({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.lightRedColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline_rounded,
            color: AppColors.redColor,
            size: 20.sp,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              message,
              style: AppTextStyles.regular12.copyWith(
                color: AppColors.redColor,
              ),
            ),
          ),
          TextButton(
            onPressed: () => context.read<TextAnalyzerBloc>().add(
              const TextAnalyzerEvent.retryEvent(),
            ),
            child: Text(
              'Retry',
              style: AppTextStyles.bold12.copyWith(color: AppColors.redColor),
            ),
          ),
        ],
      ),
    );
  }
}
