import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/core/global/app_colors.dart';

import 'package:time_luxe/core/global/app_text_styles.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/time_luxe_app_view.dart';

import '../../../../core/global/app_assets.dart';

class NotificationsViewBody extends StatelessWidget {
  const NotificationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.gradientColors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: SizeConfig.screenHeight! * 0.08),
            Text(
              "Stay in the Loop",
              style: AppTextStyles.textStyle32,
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.015),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                "We'll send notifications to keep you updated on your orders",
                style: AppTextStyles.textStyle15,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.08),
            SvgPicture.asset(AppAssets.group1),
            SizedBox(height: SizeConfig.screenHeight! * 0.1),
            MyCustomButton(
              width: 320.w,
              height: 49.h,
              radius: 14.r,
              backgroundColor: AppColors.darkGreen,
              onPressed: () {
                CustomHelper.buildSnackBar(
                  context: context,
                  message: "Notifications are turned on",
                  state: SnackBarStates.success,
                  title: "Success",
                );
                Future.delayed(
                  const Duration(milliseconds: 400),
                  () => CustomNavigator.navigateAndFinish(
                    screen: () => const TimeLuxeAppView(),
                  ),
                );
              },
              hasPrefix: false,
              child: Center(
                child: Text(
                  "Turn on Notifications",
                  style: AppTextStyles.textStyle20.copyWith(
                    fontSize: 23.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.015),
            MyCustomButton(
              width: 320.w,
              height: 49.h,
              radius: 14.r,
              backgroundColor: Colors.transparent,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              onPressed: () => CustomNavigator.navigateAndFinish(
                screen: () => const TimeLuxeAppView(),
              ),
              hasPrefix: false,
              child: Center(
                child: Text(
                  "Not Now",
                  style: AppTextStyles.textStyle20.copyWith(
                    fontSize: 23.sp,
                    fontWeight: FontWeight.normal,
                    color: AppColors.darkGreen,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
