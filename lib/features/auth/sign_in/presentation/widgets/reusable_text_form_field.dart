import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../../core/global/app_colors.dart';
import '../../../../../core/global/app_text_styles.dart';

class ReusableTextFormField extends StatelessWidget {
  const ReusableTextFormField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    required this.keyboardType,
    required this.textCapitalization,
    this.thisFocusNode,
    this.validating,
    this.onEditingComplete,
    this.onSubmit,
  });

  final TextEditingController controller;
  final FocusNode? thisFocusNode;
  final String hint, icon;
  final String? Function(String?)? validating;
  final VoidCallback? onEditingComplete;
  final void Function(String)? onSubmit;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      backgroundColor: Colors.white.withOpacity(0),
      height: 50,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      cursorColor: AppColors.primaryColor,
      focusedBorderColor: AppColors.primaryColor,
      enabledBorderColor: Colors.white,
      enabledBorderWidth: 2,
      hint: hint,
      hintStyle: AppTextStyles.textStyle16.copyWith(
        color: const Color(0xFF676161).withOpacity(0.88),
        fontWeight: FontWeight.w600,
      ),
      style: AppTextStyles.textStyle16.copyWith(fontWeight: FontWeight.w600),
      prefixIcon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(icon),
      ),
      controller: controller,
      focusNode: thisFocusNode,
      textCapitalization: textCapitalization,
      keyboardType: keyboardType,
      validating: validating,
      onEditingComplete: onEditingComplete,
      onSubmit: onSubmit,
    );
  }
}
