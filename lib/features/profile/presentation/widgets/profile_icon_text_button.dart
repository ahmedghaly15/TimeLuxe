import 'package:flutter/material.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_text_styles.dart';

class ProfileIconTextButton extends StatelessWidget {
  const ProfileIconTextButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      label: Text(
        text,
        style: AppTextStyles.textStyle20.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      icon: Icon(
        icon,
        color: AppColors.primaryColor,
        size: 24,
      ),
      onPressed: onPressed,
    );
  }
}
