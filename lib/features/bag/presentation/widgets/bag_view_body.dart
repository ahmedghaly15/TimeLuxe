import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_cubit.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_states.dart';

import 'package:time_luxe/core/global/app_text_styles.dart';

import 'package:time_luxe/core/widgets/custom_app_bar.dart';
import 'package:time_luxe/features/bag/presentation/widgets/done_square.dart';
import 'package:time_luxe/features/check_out/presentation/views/check_out_view.dart';

import 'package:time_luxe/features/favorites/presentation/views/favorites_view.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/widgets/customized_divider.dart';
import 'bag_products_list.dart';

class BagViewBody extends StatelessWidget {
  const BagViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeLuxeCubit, TimeLuxeStates>(
        builder: (context, state) {
      TimeLuxeCubit cubit = TimeLuxeCubit.getObject(context);
      String totalPrice =
          cubit.countAllBagPrices().toStringAsFixed(1).toString();

      return Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        padding: EdgeInsets.only(top: 24.h),
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
                CustomAppBar(
                  padding: EdgeInsets.only(left: 24.w, right: 48.w),
                  title: "Bag",
                  actions: GestureDetector(
                    onTap: () => CustomNavigator.navigateTo(
                      screen: () => const FavoritesView(),
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.016),
                const CustomizedDivider(),
                SizedBox(height: SizeConfig.screenHeight! * 0.039),
                BagProductsList(cubit: cubit),
                SizedBox(height: SizeConfig.screenHeight! * 0.02),
                Padding(
                  padding: EdgeInsets.only(right: 15.w),
                  child: Row(
                    children: <Widget>[
                      const DoneSquare(),
                      SizedBox(width: SizeConfig.screenWidth! * 0.039),
                      Text(
                        "Choose all",
                        style: AppTextStyles.textStyle20.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "\$$totalPrice",
                        style: AppTextStyles.textStyle20.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.029),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: MyCustomButton(
                      height: 49.h,
                      width: SizeConfig.screenWidth! * 0.9,
                      radius: 8.r,
                      onPressed: () => CustomNavigator.navigateTo(
                        screen: () => CheckOutView(subtotal: totalPrice),
                      ),
                      hasPrefix: false,
                      backgroundColor: AppColors.primaryColor,
                      child: Center(
                        child: Text(
                          "Checkout",
                          style: AppTextStyles.textStyle32.copyWith(
                            fontSize: 23.sp,
                          ),
                        ),
                      ),
                    ),
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
