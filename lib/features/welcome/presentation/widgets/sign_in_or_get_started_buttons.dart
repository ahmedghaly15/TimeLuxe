import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../component/custom_button.dart';
import '../../../../constants.dart';
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
        CustomButton(
          onTap: () {
            CustomNavigator.navigateTo(
              screen: () => const SignInView(),
            );
          },
          text: "Sign In",
          color: white,
          textColor: Colors.black,
        ),
        const SizedBox(
          width: 24,
        ),
        CustomButton(
          onTap: () => CustomNavigator.navigateTo(
            screen: () => const SignUpView(),
          ),
          text: "Get Started",
          color: green,
          textColor: Colors.white,
        ),
      ],
    );
  }
}
