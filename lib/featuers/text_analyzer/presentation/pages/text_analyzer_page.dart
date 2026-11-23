import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';
import '../bloc/text_analyzer_bloc.dart';
import '../widgets/note_text_field_widget.dart';
import '../widgets/stats_panel_widget.dart';

/// One multi-line text field with a live stats panel below it.
class TextAnalyzerPage extends StatelessWidget {
  const TextAnalyzerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Live Text Analyzer',
          style: AppTextStyles.bold18.copyWith(color: AppColors.darkBlue),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Expanded(
                  child: NoteTextFieldWidget(
                    // The full text goes to the bloc on every change. That is
                    // cheap: it passes a reference to the string, not a copy.
                    onChanged: (text) => context.read<TextAnalyzerBloc>().add(
                      TextAnalyzerEvent.textChangedEvent(text: text),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                // When the keyboard is open the screen gets short. The panel
                // then scrolls instead of squeezing the text field away.
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: constraints.maxHeight * 0.5,
                  ),
                  child: const SingleChildScrollView(child: StatsPanelWidget()),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
