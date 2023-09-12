import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_cubit.dart';

import '../../../../TimeLuxe/presentation/view/manager/time_luxe_states.dart';
import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_text_styles.dart';

class ConfirmEditingProfileImage extends StatelessWidget {
  const ConfirmEditingProfileImage({
    super.key,
    required this.state,
    required this.cubit,
    required this.nameController,
    required this.emailController,
  });

  final TimeLuxeStates state;
  final TimeLuxeCubit cubit;
  final TextEditingController nameController;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MyCustomButton(
          radius: 32.r,
          height: 40.h,
          width: SizeConfig.screenWidth! * 0.5,
          backgroundColor: AppColors.primaryColor,
          onPressed: () => cubit.uploadProfileImage(
            context: context,
            name: nameController.text,
            email: emailController.text,
          ),
          hasPrefix: false,
          child: Center(
            child: Text(
              "Update Profile Image",
              style: AppTextStyles.textStyle16.copyWith(
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
        ),
        if (state is UploadingProfileImageLoadingState)
          SizedBox(height: SizeConfig.screenHeight! * 0.01),
        if (state is UploadingProfileImageLoadingState)
          SizedBox(
            width: SizeConfig.screenWidth! * 0.4,
            child: const LinearProgressIndicator(
              color: AppColors.primaryColor,
              backgroundColor: Colors.transparent,
            ),
          ),
      ],
    );
  }
}
