import 'package:flutter/material.dart';

import '../../../../../core/global/app_assets.dart';
import '../cubit/sign_in_cubit.dart';
import 'login_with_social_button.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
    required this.cubit,
  });

  final SignInViewCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        LoginWithSocialButton(
          onPressed: () {},
          text: "Sign in with Facebook",
          icon: AppAssets.iconsUilFacebook,
        ),
        LoginWithSocialButton(
          onPressed: () => cubit.signInWithGoogle(),
          text: "Sign in with Google",
          icon: AppAssets.iconsGgGoogle,
        ),
        LoginWithSocialButton(
          onPressed: () {},
          text: "Sign in with Apple",
          icon: AppAssets.iconsBiApple,
        ),
      ],
    );
  }
}
