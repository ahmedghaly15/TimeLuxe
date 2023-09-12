import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_text_styles.dart';

class NewCardTextField extends StatefulWidget {
  const NewCardTextField({
    super.key,
  });

  @override
  State<NewCardTextField> createState() => _NewCardTextFieldState();
}

class _NewCardTextFieldState extends State<NewCardTextField> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: CustomTextFormField(
        backgroundColor: Colors.white.withOpacity(0),
        hint: "Or add a new card",
        hintStyle: AppTextStyles.textStyle16.copyWith(
          color: AppColors.hintColor,
          fontWeight: FontWeight.w600,
        ),
        prefixIcon: Icon(
          Icons.add,
          color: AppColors.hintColor,
        ),
        controller: textEditingController,
        textCapitalization: TextCapitalization.none,
        keyboardType: TextInputType.text,
        focusedBorderColor: AppColors.primaryColor,
        focusedBorderWidth: 1,
        enabledBorderColor: Colors.white,
        enabledBorderWidth: 1,
      ),
    );
  }
}
