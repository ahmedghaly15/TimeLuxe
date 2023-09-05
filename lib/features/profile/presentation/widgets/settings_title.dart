import 'package:flutter/material.dart';

import '../../../../core/global/app_text_styles.dart';

class SettingsTitle extends StatelessWidget {
  const SettingsTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: AppTextStyles.textStyle24.copyWith(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
