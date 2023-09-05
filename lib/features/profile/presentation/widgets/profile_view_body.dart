import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/core/global/app_text_styles.dart';

import '../../../../core/global/app_colors.dart';
import 'current_user_info.dart';
import 'general_settings.dart';
import 'profile_view_app_bar.dart';
import 'settings_title.dart';
import 'user_services.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      padding: const EdgeInsets.symmetric(vertical: 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.secondGradientColors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: SizeConfig.screenHeight! * 0.05),
          const ProfileViewAppBar(),
          const SizedBox(height: 16),
          CustomDivider(
            color: Colors.white,
            height: 0.5,
            width: SizeConfig.screenWidth,
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.033),
          const CurrentUserInfo(),
          SizedBox(height: SizeConfig.screenHeight! * 0.041),
          const UserServices(),
          SizedBox(height: SizeConfig.screenHeight! * 0.016),
          const SettingsTitle(title: "General Settings"),
          const GeneralSettings(),
          const SettingsTitle(title: "Other"),
          Padding(
            padding: EdgeInsets.only(
              left: 54,
              top: SizeConfig.screenHeight! * 0.01,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Contact Preferences",
                  style: AppTextStyles.textStyle20.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.025),
                Text(
                  "Terms & Conditions ",
                  style: AppTextStyles.textStyle20.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
