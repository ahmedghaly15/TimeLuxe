import 'package:flutter/material.dart';
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
        MyCustomButton(
          onPressed: () {
            CustomNavigator.navigateTo(
              screen: () => const SignInView(),
            );
          },
          radius: 18,
          height: 61,
          width: SizeConfig.screenWidth! * 0.36,
          backgroundColor: const Color(0xFFD9D9D9),
          hasPrefix: false,
          child: Center(
              child: Text(
            "Sign in",
            style: AppTextStyles.textStyle20.copyWith(
              fontWeight: FontWeight.w600,
            ),
          )),
        ),
        const SizedBox(
          width: 24,
        ),
        MyCustomButton(
          onPressed: () {
            CustomNavigator.navigateTo(
              screen: () => const SignUpView(),
            );
          },
          radius: 18,
          height: 61,
          width: SizeConfig.screenWidth! * 0.36,
          backgroundColor: AppColors.primaryColor,
          hasPrefix: false,
          child: Center(
              child: Text(
            "Get Started",
            style: AppTextStyles.textStyle20.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          )),
        )
      ],
    );
  }
}
