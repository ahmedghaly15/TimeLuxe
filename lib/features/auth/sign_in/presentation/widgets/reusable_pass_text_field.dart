import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../../core/global/app_colors.dart';
import '../../../../../core/global/app_text_styles.dart';
import 'visibility_icon_button.dart';

class ReusablePassTextField extends StatelessWidget {
  const ReusablePassTextField({
    super.key,
    required this.controller,
    required this.thisFocusNode,
    required this.hint,
    required this.prefixIcon,
    required this.visibilityIcon,
    required this.obscure,
    this.nextFocusNode,
    this.onSubmit,
    this.visibilityButtonOnPressed,
    this.validating,
    this.onEditingComplete,
  });

  final TextEditingController controller;
  final FocusNode thisFocusNode;
  final FocusNode? nextFocusNode;
  final String hint, prefixIcon;
  final IconData visibilityIcon;
  final bool obscure;

  final void Function(String)? onSubmit;
  final void Function()? visibilityButtonOnPressed;
  final String? Function(String?)? validating;
  final VoidCallback? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      backgroundColor: AppColors.authScaffoldBackgroundColor,
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
        child: SvgPicture.asset(prefixIcon),
      ),
      prefixIconColor: Colors.white,
      controller: controller,
      focusNode: thisFocusNode,
      textCapitalization: TextCapitalization.none,
      keyboardType: TextInputType.visiblePassword,
      suffixIconColor: AppColors.primaryColor,
      obscure: obscure,
      suffixIcon: VisibilityIconButton(
        icon: visibilityIcon,
        onPressed: visibilityButtonOnPressed,
      ),
      validating: validating,
      onSubmit: onSubmit,
      onEditingComplete: onEditingComplete,
    );
  }
}
