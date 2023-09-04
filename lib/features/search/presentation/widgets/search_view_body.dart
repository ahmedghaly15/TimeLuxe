import 'package:flutter/material.dart';

import 'package:reusable_components/reusable_components.dart';

import 'package:time_luxe/core/global/app_colors.dart';
import 'package:time_luxe/core/global/app_text_styles.dart';

import 'brands_list.dart';
import 'explore_recommendations.dart';
import 'search_text_field.dart';
import 'title_text.dart';
import 'trending_products_list.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      padding: const EdgeInsets.symmetric(vertical: 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.gradientBackGroundColors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: SizeConfig.screenHeight! * 0.05),
          SearchTextField(onTap: () {}),
          SizedBox(height: SizeConfig.screenHeight! * 0.03),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const TitleText(title: "Featured brands"),
                CustomTextButton(
                  splashColor: AppColors.lightYellow,
                  onTap: () {},
                  text: "view more",
                  textStyle: AppTextStyles.textStyle24.copyWith(
                    color: AppColors.darkGreen,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.05),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: BrandsList(),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.05),
          const Padding(
            padding: EdgeInsets.only(left: 16, bottom: 16),
            child: TitleText(title: "Trending Product"),
          ),
          const TrendingProductsList(),
          const SizedBox(height: 61),
          const ExploreRecommendations(),
        ],
      ),
    );
  }
}
