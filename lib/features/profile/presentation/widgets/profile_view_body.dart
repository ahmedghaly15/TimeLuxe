import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_cubit.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_states.dart';

import 'package:time_luxe/core/models/user_model.dart';
import 'package:time_luxe/features/profile/presentation/widgets/sign_out_floating_button.dart';

import '../../../../core/global/app_assets.dart';
import '../../../../core/global/app_colors.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/widgets/customized_divider.dart';
import 'current_user_info.dart';
import 'general_settings.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'other_settings.dart';
import 'settings_title.dart';
import 'user_services.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeLuxeCubit, TimeLuxeStates>(
        builder: (context, state) {
      TimeLuxeCubit cubit = TimeLuxeCubit.getObject(context);
      UserModel user = Helper.model!;

      return Stack(
        children: <Widget>[
          Container(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            padding: EdgeInsets.symmetric(vertical: 22.h),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: SizeConfig.screenHeight! * 0.05),
                    CustomAppBar(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      title: "Profile",
                      actions: Row(
                        children: <Widget>[
                          Icon(
                            Icons.email_outlined,
                            size: 35.w,
                            color: Colors.white,
                          ),
                          SizedBox(width: SizeConfig.screenWidth! * 0.05),
                          SvgPicture.asset(
                            AppAssets.profileNotificationsIcon,
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight! * 0.02),
                    const CustomizedDivider(),
                    SizedBox(height: SizeConfig.screenHeight! * 0.025),
                    CurrentUserInfo(user: user),
                    SizedBox(height: SizeConfig.screenHeight! * 0.02),
                    const UserServices(),
                    SizedBox(height: SizeConfig.screenHeight! * 0.006),
                    const SettingsTitle(title: "General Settings"),
                    const GeneralSettings(),
                    const SettingsTitle(title: "Other"),
                    const OtherSettings(),
                  ],
                ),
              ),
            ),
          ),
          FadeInUp(
            from: 20,
            duration: const Duration(milliseconds: 500),
            child: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: SignOutFloatingButton(cubit: cubit),
            ),
          ),
        ],
      );
    });
  }
}
