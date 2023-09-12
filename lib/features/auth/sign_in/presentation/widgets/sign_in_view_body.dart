import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/core/global/app_text_styles.dart';
import 'package:time_luxe/features/auth/sign_in/presentation/widgets/sign_in_form.dart';
import 'package:time_luxe/features/auth/sign_up/presentation/views/sign_up_view.dart';

import 'package:time_luxe/features/notifications/presentation/views/notifications_view.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TitleText(
                title: "Please Sign in",
                bottomPadding: 35.h,
              ),
              SignInForm(cubit: cubit, state: state),
              SizedBox(height: SizeConfig.screenHeight! * 0.05),
              const OrLoginWith(),
              SizedBox(height: SizeConfig.screenHeight! * 0.025),
              SocialButtons(signInViewCubit: cubit),
              SizedBox(height: SizeConfig.screenHeight! * 0.025),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account?",
                    style:
                        AppTextStyles.textStyle13.copyWith(color: Colors.black),
                  ),
                  CustomVerticalDivider(
                    width: 1.w,
                    height: 16.h,
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    color: Colors.black,
                  ),
                  CustomTextButton(
                    onTap: () => CustomNavigator.navigateTo(
                      screen: () => const SignUpView(),
                    ),
                    text: "Sign up",
                    textStyle: AppTextStyles.textStyle13.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.04),
            ],
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
        CustomNavigator.navigateAndFinishAll(
          screen: () => const NotificationsView(),
        );
      });
    }

    if (state is SignInWithGoogleSuccessState) {
      CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
        CustomNavigator.navigateAndFinishAll(
          screen: () => const NotificationsView(),
        );
      });
    }
  }
}
