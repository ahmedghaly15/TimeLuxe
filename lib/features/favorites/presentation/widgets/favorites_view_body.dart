import 'package:animate_do/animate_do.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_cubit.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_states.dart';

import '../../../../core/global/app_colors.dart';

import '../../../../core/widgets/fall_back_text.dart';
import '../../../../core/widgets/search_text_field.dart';
import 'fav_item.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeLuxeCubit, TimeLuxeStates>(
        builder: (context, state) {
      TimeLuxeCubit cubit = TimeLuxeCubit.getObject(context);

      return Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        padding: EdgeInsets.symmetric(vertical: 24.h),
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
              children: <Widget>[
                SizedBox(height: SizeConfig.screenHeight! * 0.05),
                SearchTextField(
                  onTap: () {},
                  hint: "Favorites",
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.06),
                ConditionalBuilder(
                  condition: cubit.favorites.isNotEmpty,
                  builder: (context) => ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => FavItem(
                      favItem: cubit.favorites[index],
                      cubit: cubit,
                    ),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: SizeConfig.screenHeight! * 0.064),
                    itemCount: cubit.favorites.length,
                  ),
                  fallback: (context) => const FallBackText(
                    text:
                        "No products in the Favorites yet,\nExplore products to add one",
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
