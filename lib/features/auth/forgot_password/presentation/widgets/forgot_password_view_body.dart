import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/features/auth/forgot_password/presentation/cubit/forgot_password_view_cubit.dart';
import 'package:time_luxe/features/auth/forgot_password/presentation/widgets/forgot_password_form.dart';

import '../../../../../core/global/app_text_styles.dart';
import 'customized_app_bar.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordViewCubit, ForgotPasswordViewStates>(
      listener: (context, state) => controllingForgotPasswordViewStates(
        state,
        context,
      ),
      builder: (context, state) {
        return Column(
          children: <Widget>[
            const CustomizedAppBar(),
            Container(
              margin: EdgeInsets.only(top: 30.0.h),
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                "Enter the email associated with your account to change your password.",
                style: AppTextStyles.textStyle18,
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: ForgotPasswordForm(state: state),
            ),
          ],
        );
      },
    );
  }

  void controllingForgotPasswordViewStates(
      ForgotPasswordViewStates state, BuildContext context) {
    if (state is ResetPasswordSuccessState) {
      CustomHelper.buildSnackBar(
        context: context,
        message: "Password reset link sent!\nCheck your Email",
        state: SnackBarStates.success,
        title: "Success",
      );
    }

    if (state is ResetPasswordErrorState) {
      if (state.error == 'invalid-email') {
        CustomHelper.buildSnackBar(
          message: "Email is badly formatted",
          state: SnackBarStates.error,
          title: "Something went wrong",
          context: context,
        );
      } else if (state.error == 'user-not-found') {
        CustomHelper.buildSnackBar(
          message: "No user found for this email",
          state: SnackBarStates.error,
          context: context,
          title: "Something went wrong",
        );
      }
    }
  }
}
