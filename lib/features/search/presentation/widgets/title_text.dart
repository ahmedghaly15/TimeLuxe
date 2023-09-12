import 'package:flutter/material.dart';

import '../../../../core/global/app_text_styles.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.textStyle24,
    );
  }
}
