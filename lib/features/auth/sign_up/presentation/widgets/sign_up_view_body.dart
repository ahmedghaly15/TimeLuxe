import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/features/auth/sign_in/presentation/views/sign_in_view.dart';
import 'package:time_luxe/features/auth/sign_up/presentation/cubit/sign_up_view_cubit.dart';
import 'package:time_luxe/features/auth/sign_up/presentation/widgets/sign_up_form.dart';

import '../../../../../core/global/app_colors.dart';
import '../../../../../core/global/app_text_styles.dart';
import '../../../../../core/network/local/cache_helper.dart';
import '../../../../home/home_view.dart';
import '../../../sign_in/presentation/widgets/or_login_with.dart';
import '../../../sign_in/presentation/widgets/social_buttons.dart';
import '../../../sign_in/presentation/widgets/title_text.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpViewCubit, SignUpViewStates>(
      listener: (context, state) => controlSignUpViewStates(state, context),
      builder: (context, state) {
        SignUpViewCubit cubit = SignUpViewCubit.getObject(context);

        return SingleChildScrollView(
          child: SizedBox(
            // To allow using SingleChildScrollView Widget
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TitleText(
                  title: "Let's Get Started",
                  bottomPadding: SizeConfig.screenHeight! * 0.03,
                ),
                SignUpForm(cubit: cubit, state: state),
                SizedBox(height: SizeConfig.screenHeight! * 0.035),
                const OrLoginWith(),
                SizedBox(height: SizeConfig.screenHeight! * 0.025),
                SocialButtons(signUpViewCubit: cubit),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Do you have an account?",
                      style: AppTextStyles.textStyle13,
                    ),
                    const CustomVerticalDivider(
                      width: 1,
                      height: 16,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      color: Colors.black,
                    ),
                    CustomTextButton(
                      onTap: () => CustomNavigator.navigateAndFinishAll(
                        screen: () => const SignInView(),
                      ),
                      text: "Sign in",
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

  void controlSignUpViewStates(SignUpViewStates state, BuildContext context) {
    if (state is SignUpErrorState) {
      if (state.error == 'weak-password') {
        CustomHelper.buildSnackBar(
          title: "Warning",
          message: "Password is too weak",
          state: SnackBarStates.error,
          context: context,
        );
      } else if (state.error == 'email-already-in-use') {
        CustomHelper.buildSnackBar(
          title: "Warning",
          message: "Account already exists",
          state: SnackBarStates.error,
          context: context,
        );
      }
    }

    if (state is SignUpSuccessState) {
      CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
        CustomNavigator.navigateAndFinishAll(screen: () => const HomeView());
      });
      CustomHelper.buildSnackBar(
        title: "Success",
        message: "Account Created Successfully",
        state: SnackBarStates.success,
        context: context,
      );
    }

    if (state is CreateUserSuccessState) {
      CustomNavigator.navigateAndFinishAll(screen: () => const HomeView());
    }

    if (state is SignInWithGoogleSuccessState) {
      CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
        CustomNavigator.navigateAndFinishAll(screen: () => const HomeView());
      });
    }
  }
}
