import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../../core/global/app_text_styles.dart';

class OrLoginWith extends StatelessWidget {
  const OrLoginWith({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildDivider(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            "Or login with",
            style: AppTextStyles.textStyle16.copyWith(color: Colors.black),
          ),
        ),
        buildDivider(),
      ],
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: CustomDivider(
        color: Colors.black,
        height: 0.5.h,
      ),
    );
  }
}
