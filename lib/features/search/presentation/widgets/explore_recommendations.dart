import 'package:flutter/material.dart';
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
          left: 34,
          top: 17,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "You'll love These",
                style: AppTextStyles.textStyle16.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Check out your recommendations",
                style: AppTextStyles.textStyle16.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              MyCustomButton(
                height: 37,
                width: 108,
                radius: 25,
                backgroundColor: AppColors.primaryColor,
                onPressed: () {},
                hasPrefix: false,
                child: Center(
                  child: Text(
                    "Explore",
                    style: AppTextStyles.textStyle16.copyWith(
                      color: Colors.white,
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
