import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/core/global/app_colors.dart';
import 'package:time_luxe/features/auth/sign_in/presentation/cubit/sign_in_cubit.dart';

import 'visibility_icon_button.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key, required this.cubit});

  final SignInViewCubit cubit;

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
              hint: "Enter your Email",
              hintStyle: const TextStyle(color: Color(0xFFD9D9D9)),
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
            SizedBox(height: SizeConfig.screenHeight! * 0.015),
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
          ],
        ),
      ),
    );
  }

  void signIn(BuildContext context) {
    if (formKey.currentState!.validate()) {
      // TODO: Use CustomHelper.keyboardUnfocus
      FocusScope.of(context);
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
