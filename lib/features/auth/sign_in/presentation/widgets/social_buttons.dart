import 'package:flutter/material.dart';

import '../../../../../core/global/app_assets.dart';
import '../cubit/sign_in_cubit.dart';
import 'login_with_social_button.dart';

class SocialButtons extends StatefulWidget {
  const SocialButtons({
    super.key,
    required this.cubit,
  });

  final SignInViewCubit cubit;

  @override
  State<SocialButtons> createState() => _SocialButtonsState();
}

class _SocialButtonsState extends State<SocialButtons> {
  bool isFacebookButtonClicked = false;
  bool isGoogleButtonClicked = false;
  bool isAppleButtonClicked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        LoginWithSocialButton(
          onPressed: () {
            setState(() {
              isFacebookButtonClicked = true;
            });

            Future.delayed(
              const Duration(seconds: 1),
              () {
                debugPrint("Facebook Button is Clicked");
                setState(() {
                  isFacebookButtonClicked = false;
                });
              },
            );
          },
          isActive: isFacebookButtonClicked,
          text: "Sign in with Facebook",
          icon: AppAssets.iconsUilFacebook,
        ),
        LoginWithSocialButton(
          onPressed: () {
            setState(() {
              isGoogleButtonClicked = true;
            });

            Future.delayed(
              const Duration(seconds: 1),
              () {
                widget.cubit.signInWithGoogle();
                setState(() {
                  isGoogleButtonClicked = false;
                });
              },
            );
          },
          isActive: isGoogleButtonClicked,
          text: "Sign in with Google",
          icon: AppAssets.iconsGgGoogle,
        ),
        LoginWithSocialButton(
          onPressed: () {
            setState(() {
              isAppleButtonClicked = true;
            });

            Future.delayed(
              const Duration(seconds: 1),
              () {
                debugPrint("Apple Button is Clicked");
                setState(() {
                  isAppleButtonClicked = false;
                });
              },
            );
          },
          isActive: isAppleButtonClicked,
          text: "Sign in with Apple",
          icon: AppAssets.iconsBiApple,
        ),
      ],
    );
  }
}
