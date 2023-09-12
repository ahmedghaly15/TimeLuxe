import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../core/global/app_assets.dart';
import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_text_styles.dart';

class ExploreRecommendations extends StatelessWidget {
  const ExploreRecommendations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(AppAssets.searchWatch),
        Positioned(
          left: 34.w,
          top: 3.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "You'll love These",
                style: AppTextStyles.textStyle16.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.005),
              Text(
                "Check out your recommendations",
                style: AppTextStyles.textStyle16.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.01),
              MyCustomButton(
                height: 27.h,
                width: 108.w,
                radius: 25.r,
                backgroundColor: AppColors.primaryColor,
                onPressed: () {},
                hasPrefix: false,
                child: Center(
                  child: Text(
                    "Explore",
                    style: AppTextStyles.textStyle16.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
