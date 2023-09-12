import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../../core/global/app_colors.dart';
import '../../../../../core/global/app_text_styles.dart';

class CustomizedAppBar extends StatelessWidget {
  const CustomizedAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight! * 0.12,
          color: AppColors.primaryColor,
        ),
        Positioned(
          left: 15.w,
          top: 30.w,
          child: IconButton(
            onPressed: () => CustomNavigator.getBack(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 25.w,
            ),
          ),
        ),
        Positioned(
          left: 105.w,
          top: 40.w,
          child: Text(
            "Find your account",
            style: AppTextStyles.textStyle20.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
