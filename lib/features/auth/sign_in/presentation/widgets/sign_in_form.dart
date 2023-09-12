import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/core/global/app_colors.dart';
import 'package:time_luxe/core/global/app_text_styles.dart';
import 'package:time_luxe/features/auth/sign_in/presentation/cubit/sign_in_cubit.dart';
import 'package:time_luxe/features/auth/sign_in/presentation/cubit/sign_in_states.dart';
import 'package:time_luxe/features/auth/forgot_password/presentation/views/forgot_password_view.dart';
import 'package:time_luxe/features/auth/sign_in/presentation/widgets/reusable_pass_text_field.dart';

import '../../../../../core/global/app_assets.dart';
import '../../../../../core/widgets/my_circular_progress_indicator.dart';
import 'reusable_text_form_field.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key, required this.cubit, required this.state});

  final SignInViewCubit cubit;
  final SignInViewStates state;

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();

    disposeControllers();

    disposeFocusNodes();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(height: SizeConfig.screenHeight! * 0.035),
            ReusableTextFormField(
              controller: emailController,
              thisFocusNode: emailFocusNode,
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
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(passwordFocusNode);
              },
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.05),
            ReusablePassTextField(
              controller: passwordController,
              thisFocusNode: passwordFocusNode,
              hint: "Enter your Password",
              prefixIcon: AppAssets.iconsMdiPassword,
              visibilityIcon: widget.cubit.passVisibility
                  ? Icons.visibility_rounded
                  : Icons.visibility_off_rounded,
              visibilityButtonOnPressed: () =>
                  widget.cubit.switchPassVisibility(),
              obscure: widget.cubit.passVisibility,
              validating: (String? value) {
                CustomHelper.validatingPasswordField(
                  context: context,
                  value: value,
                );
                return null;
              },
              onSubmit: (String value) => signIn(context),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.013),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: CustomTextButton(
                onTap: () => CustomNavigator.navigateTo(
                  screen: () => const ForgotPasswordView(),
                ),
                text: "Forgot Password?",
                textStyle: AppTextStyles.textStyle14,
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.035),
            ConditionalBuilder(
              condition: widget.state is! SignInLoadingState,
              builder: (context) => MyCustomButton(
                backgroundColor: AppColors.primaryColor,
                height: 49.h,
                width: 320.w,
                radius: 14.r,
                hasPrefix: false,
                onPressed: () => signIn(context),
                child: Center(
                  child: Text(
                    "Sign in",
                    style: AppTextStyles.textStyle32.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              fallback: (context) => const MyCircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }

  void signIn(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      CustomHelper.keyboardUnfocus(context);
      widget.cubit.userSignIn(
        context: context,
        email: emailController.text.trim(),
        password: passwordController.text,
      );
    }
  }

  void disposeFocusNodes() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
  }
}
