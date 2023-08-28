import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/core/global/app_colors.dart';
import 'package:time_luxe/core/global/app_text_styles.dart';
import 'package:time_luxe/features/auth/sign_in/presentation/cubit/sign_in_cubit.dart';
import 'package:time_luxe/features/auth/sign_in/presentation/cubit/sign_in_states.dart';

import '../../../../../core/global/app_assets.dart';
import 'visibility_icon_button.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key, required this.cubit, required this.state});

  final SignInViewCubit cubit;
  final SignInViewStates state;

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            SizedBox(height: SizeConfig.screenHeight! * 0.035),
            CustomTextFormField(
              backgroundColor: AppColors.authScaffoldBackgroundColor,
              height: 50,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              cursorColor: AppColors.primaryColor,
              focusedBorderColor: AppColors.primaryColor,
              enabledBorderColor: Colors.white,
              enabledBorderWidth: 2,
              hint: "Enter your e-mail",
              hintStyle: const TextStyle(color: Color(0xFFD9D9D9)),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(AppAssets.iconsDashiconsEmailAlt),
              ),
              controller: emailController,
              focusNode: emailFocusNode,
              textCapitalization: TextCapitalization.none,
              keyboardType: TextInputType.emailAddress,
              validating: (String? value) {
                CustomHelper.validatingEmailField(
                    context: context, value: value);
                return null;
              },
              onEditingComplete: () =>
                  FocusScope.of(context).requestFocus(passwordFocusNode),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.05),
            CustomTextFormField(
              backgroundColor: AppColors.authScaffoldBackgroundColor,
              height: 50,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              cursorColor: AppColors.primaryColor,
              focusedBorderColor: AppColors.primaryColor,
              enabledBorderColor: Colors.white,
              enabledBorderWidth: 2,
              hint: "Enter your Password",
              hintStyle: const TextStyle(color: Color(0xFFD9D9D9)),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(AppAssets.iconsMdiPassword),
              ),
              prefixIconColor: Colors.white,
              controller: passwordController,
              focusNode: passwordFocusNode,
              textCapitalization: TextCapitalization.none,
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: VisibilityIconButton(
                onPressed: () => widget.cubit.switchPassVisibility(),
                icon: widget.cubit.passVisibility
                    ? Icons.visibility_rounded
                    : Icons.visibility_off_rounded,
              ),
              suffixIconColor: AppColors.primaryColor,
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
              alignment: Alignment.centerRight,
              child: CustomTextButton(
                onTap: () {
                  // TODO: Forgot Password Logic
                },
                text: "Forgot Password?",
                textStyle: AppTextStyles.textStyle14,
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.035),
            ConditionalBuilder(
              condition: widget.state is! SignInLoadingState,
              builder: (context) => MyCustomButton(
                backgroundColor: AppColors.primaryColor,
                height: 59,
                width: 375,
                radius: 14,
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
              fallback: (context) => const CustomCircularProgressIndicator(
                color: AppColors.primaryColor,
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signIn(BuildContext context) {
    if (formKey.currentState!.validate()) {
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
