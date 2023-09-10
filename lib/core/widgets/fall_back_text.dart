import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';

import '../global/app_text_styles.dart';

class FallBackText extends StatelessWidget {
  const FallBackText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.screenHeight! * 0.3),
      child: Center(
        child: Text(
          text,
          style: AppTextStyles.textStyle18.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
