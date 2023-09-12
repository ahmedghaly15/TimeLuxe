import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/core/global/app_text_styles.dart';

import '../../../../core/global/app_assets.dart';
import '../../../../core/global/app_colors.dart';
import '../../../../core/widgets/customized_divider.dart';
import 'checkout_app_bar.dart';
import 'new_card_text_field.dart';
import 'payment_methods.dart';

class CheckOutViewBody extends StatelessWidget {
  const CheckOutViewBody({super.key, required this.subtotal});

  final String subtotal;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const CheckoutAppBar(title: 'Checkout'),
              const CustomizedDivider(),
              Padding(
                padding: EdgeInsets.only(
                  left: 18.w,
                  top: 34.h,
                  bottom: 50.h,
                ),
                child: Text(
                  "Select Your Payment Method",
                  style: AppTextStyles.textStyle24.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const PaymentMethods(),
              SizedBox(height: SizeConfig.screenHeight! * 0.055),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Image.asset(AppAssets.checkoutImage),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.055),
              const NewCardTextField(),
              SizedBox(height: SizeConfig.screenHeight! * 0.017),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Subtotal",
                      style: AppTextStyles.textStyle27.copyWith(
                        fontSize: 23.sp,
                      ),
                    ),
                    Text(
                      "\$$subtotal",
                      style: AppTextStyles.textStyle15.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.065),
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
                      "Buy Now",
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
