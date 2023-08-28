import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/core/global/app_text_styles.dart';
import 'package:time_luxe/features/auth/sign_in/presentation/widgets/sign_in_form.dart';

import '../../../../../core/global/app_colors.dart';
import '../../../../../core/network/local/cache_helper.dart';
import '../cubit/sign_in_cubit.dart';
import '../cubit/sign_in_states.dart';
import 'or_login_with.dart';
import 'social_buttons.dart';
import 'title_text.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInViewCubit, SignInViewStates>(
      listener: (context, state) => controlSignInViewStates(state, context),
      builder: (context, state) {
        SignInViewCubit cubit = SignInViewCubit.getObject(context);
        return SingleChildScrollView(
          child: SizedBox(
            // To allow using SingleChildScrollView Widget
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const TitleText(
                  title: "Please Sign in",
                ),
                SignInForm(cubit: cubit, state: state),
                SizedBox(height: SizeConfig.screenHeight! * 0.05),
                const OrLoginWith(),
                SizedBox(height: SizeConfig.screenHeight! * 0.025),
                SocialButtons(cubit: cubit),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Don't have an account?",
                      style: AppTextStyles.textStyle13,
                    ),
                    Container(
                      width: 1,
                      height: 16,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      color: Colors.black,
                    ),
                    CustomTextButton(
                      onTap: () {
                        //TODO: navigate to SignUnView
                      },
                      text: "Sign up",
                      textStyle: AppTextStyles.textStyle13.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.025),
              ],
            ),
          ),
        );
      },
    );
  }

  void controlSignInViewStates(SignInViewStates state, BuildContext context) {
    if (state is SignInErrorState) {
      if (state.error == 'user-not-found') {
        CustomHelper.buildSnackBar(
          title: "Warning",
          message: "No user found for that email",
          state: SnackBarStates.error,
          context: context,
        );
      } else if (state.error == 'wrong-password') {
        CustomHelper.buildSnackBar(
          title: "Warning",
          message: "Wrong Password",
          state: SnackBarStates.error,
          context: context,
        );
      }
    }

    if (state is SignInSuccessState) {
      CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
        //TODO: navigate to Home
        // CustomNavigator.navigateAndFinish(screen: () => const LayoutView());
      });
    }

    if (state is SignInWithGoogleSuccessState) {
      CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
        //TODO: navigate to Home
        // CustomNavigator.navigateAndFinish(screen: () => const LayoutView());
      });
    }
  }
}
