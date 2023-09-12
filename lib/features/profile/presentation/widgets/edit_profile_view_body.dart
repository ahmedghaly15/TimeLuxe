import 'package:animate_do/animate_do.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_cubit.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_states.dart';
import 'package:time_luxe/core/global/app_text_styles.dart';

import 'package:time_luxe/features/profile/presentation/widgets/edit_profile_image.dart';
import 'package:time_luxe/features/profile/presentation/widgets/update_user_form.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/widgets/my_circular_progress_indicator.dart';
import 'confirm_editing_profile_image.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeLuxeCubit, TimeLuxeStates>(
        builder: (context, state) {
      TimeLuxeCubit cubit = TimeLuxeCubit.getObject(context);
      UserModel userModel = Helper.model!;
      final TextEditingController nameController = TextEditingController();
      final TextEditingController emailController = TextEditingController();
      final GlobalKey<FormState> formKey = GlobalKey<FormState>();

      nameController.text = userModel.name!;
      emailController.text = userModel.email!;

      return Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.gradientColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: FadeInUp(
            from: 20,
            duration: const Duration(milliseconds: 500),
            child: Column(
              children: <Widget>[
                SizedBox(height: SizeConfig.screenHeight! * 0.15),
                EditProfileImage(
                  profileImage: cubit.profileImage,
                  userModel: userModel,
                  cubit: cubit,
                ),
                if (cubit.profileImage != null) ...[
                  SizedBox(height: SizeConfig.screenHeight! * 0.015),
                  ConfirmEditingProfileImage(
                    state: state,
                    cubit: cubit,
                    nameController: nameController,
                    emailController: emailController,
                  ),
                ],
                SizedBox(height: SizeConfig.screenHeight! * 0.1),
                UpdateUserForm(
                  formKey: formKey,
                  nameController: nameController,
                  emailController: emailController,
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.12),
                ConditionalBuilder(
                  condition: state is! UserUpdateLoadingState,
                  builder: (context) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: MyCustomButton(
                      height: 49.h,
                      radius: 14.r,
                      width: SizeConfig.screenWidth! * 0.9,
                      backgroundColor: AppColors.primaryColor,
                      onPressed: () {
                        cubit.updateUser(
                          name: nameController.text,
                          email: emailController.text,
                        );
                        CustomHelper.buildSnackBar(
                          context: context,
                          message: "User updated successfully",
                          state: SnackBarStates.success,
                          title: "Success",
                        );
                      },
                      hasPrefix: false,
                      child: Center(
                        child: Text(
                          "Update",
                          style: AppTextStyles.textStyle32.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ),
                  fallback: (context) => const MyCircularProgressIndicator(),
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.04),
              ],
            ),
          ),
        ),
      );
    });
  }
}
