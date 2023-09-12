import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../../core/global/app_text_styles.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
    required this.title,
    required this.bottomPadding,
  });

  final String title;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.screenHeight! * 0.14,
        left: 24.w,
        bottom: bottomPadding,
      ),
      child: Text(
        title,
        style: AppTextStyles.textStyle32.copyWith(color: Colors.black),
      ),
    );
  }
}
