import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';

/// The multi-line notes field. It fills all the height it is given.
///
/// This is a plain [TextField] on purpose, not the shared `TextFieldWidget`.
/// That widget is built for single-line form inputs: it closes the keyboard on
/// "done" and runs form validation on every change. Notes need the Enter key
/// for new lines, and each keystroke has to stay cheap even with a huge text.
///
/// There is no `maxLength` and there are no input formatters, so the text has
/// no length limit.
class NoteTextFieldWidget extends StatelessWidget {
  const NoteTextFieldWidget({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: const BorderSide(color: AppColors.lightgreyColor),
    );

    return TextField(
      onChanged: onChanged,
      expands: true,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      textAlignVertical: TextAlignVertical.top,
      style: AppTextStyles.regular16.copyWith(height: 1.5),
      decoration: InputDecoration(
        hintText: 'Start typing or paste your notes…',
        hintStyle: AppTextStyles.regular14.copyWith(color: AppColors.greyColor),
        filled: true,
        fillColor: AppColors.lightgreyContainerColor,
        contentPadding: EdgeInsets.all(16.w),
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: const BorderSide(color: AppColors.mainColor),
        ),
      ),
    );
  }
}
