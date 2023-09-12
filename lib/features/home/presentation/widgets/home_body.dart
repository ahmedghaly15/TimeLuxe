import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_cubit.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_states.dart';
import 'package:time_luxe/features/home/presentation/widgets/home_app_bar.dart';
import 'package:time_luxe/features/home/presentation/widgets/custom_banner.dart';
import 'package:time_luxe/core/global/app_colors.dart';
import 'package:time_luxe/features/home/presentation/widgets/popular_product.dart';
import 'package:time_luxe/features/home/presentation/widgets/selling_fast.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeLuxeCubit, TimeLuxeStates>(
        builder: (context, state) {
      TimeLuxeCubit cubit = TimeLuxeCubit.getObject(context);
      return SingleChildScrollView(
        child: Container(
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: AppColors.gradientColors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: FadeInUp(
            from: 20,
            duration: const Duration(milliseconds: 500),
            child: Padding(
              padding: EdgeInsets.only(top: 36.0.h),
              child: Column(
                children: [
                  const HomeAppBar(),
                  // ********************************************
                  SizedBox(height: SizeConfig.screenHeight! * 0.018),
                  // ********************************************
                  const MyBanner(),
                  // ********************************************
                  SizedBox(height: SizeConfig.screenHeight! * 0.018),
                  // ********************************************
                  Padding(
                    padding: EdgeInsets.only(left: 16.0.w),
                    child: SellingFast(cubit: cubit),
                  ),
                  // ********************************************
                  SizedBox(height: SizeConfig.screenHeight! * 0.018),
                  // ********************************************
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.w,
                      right: 16.w,
                      bottom: 16.h,
                    ),
                    child: PopularProducts(cubit: cubit),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
