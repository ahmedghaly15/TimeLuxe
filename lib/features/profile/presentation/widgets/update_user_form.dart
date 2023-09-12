import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/core/global/app_assets.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_text_styles.dart';

class UpdateUserForm extends StatelessWidget {
  const UpdateUserForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.formKey,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            CustomTextFormField(
              backgroundColor: Colors.white.withOpacity(0),
              hint: nameController.text,
              controller: nameController,
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.name,
              cursorColor: AppColors.primaryColor,
              focusedBorderColor: AppColors.primaryColor,
              focusedBorderWidth: 2,
              enabledBorderColor: Colors.white,
              enabledBorderWidth: 2,
              style: AppTextStyles.textStyle24.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              hintStyle: AppTextStyles.textStyle24.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 14.w, right: 50.w),
                child: SvgPicture.asset(AppAssets.iconsPersonIcon),
              ),
              validating: (String? val) {
                if (val!.isEmpty) {
                  return "Name can't be blank!";
                }
                return null;
              },
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.04),
            CustomTextFormField(
              backgroundColor: Colors.white.withOpacity(0),
              hint: emailController.text,
              controller: emailController,
              textCapitalization: TextCapitalization.none,
              keyboardType: TextInputType.emailAddress,
              cursorColor: AppColors.primaryColor,
              focusedBorderColor: AppColors.primaryColor,
              focusedBorderWidth: 2,
              enabledBorderColor: Colors.white,
              enabledBorderWidth: 2,
              style: AppTextStyles.textStyle24.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              hintStyle: AppTextStyles.textStyle24.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 14.w, right: 50.w),
                child: SvgPicture.asset(AppAssets.iconsDashiconsEmailAlt),
              ),
              validating: (String? val) {
                if (val!.isEmpty) {
                  return "Email can't be blank!";
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
