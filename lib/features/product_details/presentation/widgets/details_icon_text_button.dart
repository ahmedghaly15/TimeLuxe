import 'package:flutter/material.dart';

import '../../../../core/global/app_text_styles.dart';

class DetailsIconTextButton extends StatelessWidget {
  const DetailsIconTextButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  final String text;
  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(
        text,
        style: AppTextStyles.textStyle16.copyWith(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
