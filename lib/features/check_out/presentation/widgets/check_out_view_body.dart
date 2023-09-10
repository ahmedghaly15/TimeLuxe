import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/core/global/app_text_styles.dart';

import '../../../../core/global/app_assets.dart';
import '../../../../core/global/app_colors.dart';
import '../../../../core/widgets/customized_divider.dart';
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
              Container(
                margin: EdgeInsets.only(
                  top: SizeConfig.screenHeight! * 0.07,
                  bottom: SizeConfig.screenHeight! * 0.02,
                ),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      padding: const EdgeInsets.only(left: 71, right: 40),
                      icon: SvgPicture.asset(
                        AppAssets.back,
                        color: AppColors.primaryColor,
                      ),
                      onPressed: () => CustomNavigator.getBack(),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Checkout",
                      style: AppTextStyles.textStyle32.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const CustomizedDivider(),
              Padding(
                padding: const EdgeInsets.only(left: 18, top: 34, bottom: 80),
                child: Text(
                  "Select Your Payment Method",
                  style: AppTextStyles.textStyle24.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const PaymentMethods(),
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Image.asset(AppAssets.checkoutImage),
              ),
              const SizedBox(height: 54),
              const NewCardTextField(),
              const SizedBox(height: 17),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Subtotal",
                      style: AppTextStyles.textStyle27.copyWith(
                        color: Colors.white,
                        fontSize: 23,
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
              const SizedBox(height: 48),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: MyCustomButton(
                  height: 59,
                  width: SizeConfig.screenWidth! * 0.9,
                  backgroundColor: AppColors.primaryColor,
                  radius: 8,
                  onPressed: () {},
                  hasPrefix: false,
                  child: Center(
                    child: Text(
                      "Buy Now",
                      style: AppTextStyles.textStyle27.copyWith(
                        color: Colors.white,
                        fontSize: 23,
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
  }
}
