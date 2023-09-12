import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/core/global/app_colors.dart';
import 'package:time_luxe/core/global/app_text_styles.dart';

import '../../../auth/sign_in/presentation/views/sign_in_view.dart';
import '../../../auth/sign_up/presentation/views/sign_up_view.dart';

class SignInOrGetStartedButtons extends StatelessWidget {
  const SignInOrGetStartedButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        welcomeButton(
          onPressed: () {
            CustomNavigator.navigateTo(
              screen: () => const SignInView(),
            );
          },
          buttonTitle: "Sign In",
          style: AppTextStyles.textStyle20.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          backgroundColor: const Color(0xFFD9D9D9),
        ),
        SizedBox(width: SizeConfig.screenWidth! * 0.03),
        welcomeButton(
          buttonTitle: "Get Started",
          style: AppTextStyles.textStyle20.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            CustomNavigator.navigateTo(
              screen: () => const SignUpView(),
            );
          },
        ),
      ],
    );
  }

  MyCustomButton welcomeButton({
    required String buttonTitle,
    required Color backgroundColor,
    required VoidCallback onPressed,
    required TextStyle style,
  }) {
    return MyCustomButton(
      onPressed: onPressed,
      radius: 18.r,
      height: 50.h,
      width: 135.w,
      backgroundColor: backgroundColor,
      hasPrefix: false,
      child: Center(
        child: Text(
          buttonTitle,
          style: style,
        ),
      ),
    );
  }
}
