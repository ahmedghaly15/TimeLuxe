import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../../core/global/app_assets.dart';
import '../../../../../core/global/app_colors.dart';
import '../../../../../core/global/app_text_styles.dart';
import '../../../../../core/widgets/my_circular_progress_indicator.dart';
import '../../../sign_in/presentation/widgets/reusable_pass_text_field.dart';
import '../../../sign_in/presentation/widgets/reusable_text_form_field.dart';
import '../cubit/sign_up_view_cubit.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key, required this.cubit, required this.state});

  final SignUpViewCubit cubit;
  final SignUpViewStates state;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPassFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();

    disposeFocusNodes();
    disposeControllers();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(height: SizeConfig.screenHeight! * 0.02),
            ReusableTextFormField(
              controller: nameController,
              thisFocusNode: nameFocusNode,
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.name,
              hint: "Enter your name",
              icon: AppAssets.iconsPersonIcon,
              validating: (String? value) {
                CustomHelper.validatingNameField(
                  context: context,
                  value: value,
                );

                return null;
              },
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(emailFocusNode);
              },
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.02),
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
            SizedBox(height: SizeConfig.screenHeight! * 0.02),
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
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(confirmPassFocusNode);
              },
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.02),
            ReusablePassTextField(
              controller: confirmPassController,
              thisFocusNode: confirmPassFocusNode,
              hint: "Confirm your Password",
              prefixIcon: AppAssets.iconsMdiPassword,
              visibilityIcon: widget.cubit.confirmPassVisibility
                  ? Icons.visibility_rounded
                  : Icons.visibility_off_rounded,
              visibilityButtonOnPressed: () =>
                  widget.cubit.switchConfirmPassVisibility(),
              obscure: widget.cubit.confirmPassVisibility,
              validating: (String? value) {
                CustomHelper.validatingConfirmPassField(
                  passController: passwordController,
                  context: context,
                  value: value,
                );
                return null;
              },
              onSubmit: (String? value) => signUp(context),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.03),
            ConditionalBuilder(
              condition: widget.state is! SignUpLoadingState,
              builder: (context) => MyCustomButton(
                backgroundColor: AppColors.primaryColor,
                height: 49.h,
                width: 320.w,
                radius: 14.r,
                hasPrefix: false,
                onPressed: () => signUp(context),
                child: Center(
                  child: Text(
                    "Sign up",
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

  void signUp(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      CustomHelper.keyboardUnfocus(context);
      if (passwordController.text == confirmPassController.text) {
        widget.cubit.userSignUp(
          context: context,
          email: emailController.text.trim(),
          username: nameController.text.trim(),
          password: passwordController.text,
        );
      }
    }
  }

  void disposeControllers() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
  }

  void disposeFocusNodes() {
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPassFocusNode.dispose();
  }
}
