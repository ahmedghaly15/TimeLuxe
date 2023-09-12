import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/core/global/app_assets.dart';
import 'package:time_luxe/features/check_out/presentation/widgets/my_card_form.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_text_styles.dart';
import '../../../../core/widgets/customized_divider.dart';
import 'checkout_app_bar.dart';

class MyCardViewBody extends StatelessWidget {
  const MyCardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
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
              const CheckoutAppBar(title: 'My Card'),
              const CustomizedDivider(),
              SizedBox(height: SizeConfig.screenHeight! * 0.025),
              Image.asset(AppAssets.visaCard),
              SizedBox(height: SizeConfig.screenHeight! * 0.032),
              const MyCardForm(),
              SizedBox(height: SizeConfig.screenHeight! * 0.025),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: MyCustomButton(
                  height: 49.h,
                  width: SizeConfig.screenWidth! * 0.9,
                  backgroundColor: AppColors.primaryColor,
                  radius: 8.r,
                  onPressed: () {},
                  hasPrefix: false,
                  child: Center(
                    child: Text(
                      "Pay Now",
                      style: AppTextStyles.textStyle27.copyWith(
                        fontSize: 23.sp,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.035),
            ],
          ),
        ),
      ),
    );
  }
}
