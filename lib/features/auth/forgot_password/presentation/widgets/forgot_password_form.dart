import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/core/widgets/my_circular_progress_indicator.dart';
import 'package:time_luxe/features/auth/forgot_password/presentation/cubit/forgot_password_view_cubit.dart';

import 'package:time_luxe/features/auth/sign_in/presentation/widgets/reusable_text_form_field.dart';

import '../../../../../core/global/app_assets.dart';
import '../../../../../core/global/app_colors.dart';
import '../../../../../core/global/app_text_styles.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key, required this.state});

  final ForgotPasswordViewStates state;

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          ReusableTextFormField(
            controller: emailController,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.emailAddress,
            hint: "Enter your e-mail",
            icon: AppAssets.iconsDashiconsEmailAlt,
            validating: (String? value) {
              CustomHelper.validatingEmailField(
                context: context,
                value: value,
              );

              return null;
            },
            onSubmit: (String? value) => resetPassword(context),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.025),
          ConditionalBuilder(
            condition: widget.state is! ResetPasswordLoadingState,
            builder: (context) => Align(
              alignment: AlignmentDirectional.centerEnd,
              child: MyCustomButton(
                backgroundColor: AppColors.primaryColor,
                height: 35.h,
                width: SizeConfig.screenWidth! * 0.35,
                radius: 14.r,
                hasPrefix: false,
                onPressed: () => resetPassword(context),
                child: Center(
                  child: Text(
                    "Reset password",
                    style: AppTextStyles.textStyle14.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            fallback: (context) => const MyCircularProgressIndicator(),
          ),
        ],
      ),
    );
  }

  void resetPassword(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      CustomHelper.keyboardUnfocus(context);
      ForgotPasswordViewCubit.getObject(context).resetPassword(
        email: emailController.text,
      );
    }
  }
}
