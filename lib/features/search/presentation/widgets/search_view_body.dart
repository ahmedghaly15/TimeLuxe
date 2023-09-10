import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_cubit.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_states.dart';

import 'package:time_luxe/core/global/app_colors.dart';
import 'package:time_luxe/core/global/app_text_styles.dart';

import 'brands_list.dart';
import 'explore_recommendations.dart';
import '../../../../core/widgets/search_text_field.dart';
import 'title_text.dart';
import 'trending_products_list.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeLuxeCubit, TimeLuxeStates>(
      builder: (context, state) {
        TimeLuxeCubit cubit = TimeLuxeCubit.getObject(context);
        return Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          padding: const EdgeInsets.symmetric(vertical: 32),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: AppColors.gradientColors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            child: FadeInUp(
              from: 20,
              duration: const Duration(milliseconds: 500),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: SizeConfig.screenHeight! * 0.05),
                  SearchTextField(
                    onTap: () {},
                    hint: "Search",
                  ),
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
                  SizedBox(height: SizeConfig.screenHeight! * 0.03),
                  const Padding(
                    padding: EdgeInsets.only(left: 16, bottom: 16),
                    child: TitleText(title: "Trending Product"),
                  ),
                  TrendingProductsList(cubit: cubit),
                  const SizedBox(height: 61),
                  const ExploreRecommendations(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
