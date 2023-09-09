import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_cubit.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_states.dart';

import 'package:time_luxe/core/models/user_model.dart';
import 'package:time_luxe/features/profile/presentation/widgets/sign_out_floating_button.dart';

import '../../../../core/global/app_assets.dart';
import '../../../../core/global/app_colors.dart';
import '../../../../core/global/helper.dart';
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
          SingleChildScrollView(
            child: Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              padding: const EdgeInsets.symmetric(vertical: 32),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: AppColors.gradientColors,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: FadeInUp(
                from: 20,
                duration: const Duration(milliseconds: 500),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: SizeConfig.screenHeight! * 0.05),
                    CustomAppBar(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      title: "Profile",
                      actions: Row(
                        children: <Widget>[
                          const Icon(
                            Icons.email_outlined,
                            size: 35,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 21),
                          SvgPicture.asset(
                            AppAssets.profileNotificationsIcon,
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    CustomDivider(
                      color: Colors.white,
                      height: 0.5,
                      width: SizeConfig.screenWidth,
                    ),
                    SizedBox(height: SizeConfig.screenHeight! * 0.033),
                    CurrentUserInfo(user: user),
                    SizedBox(height: SizeConfig.screenHeight! * 0.041),
                    const UserServices(),
                    SizedBox(height: SizeConfig.screenHeight! * 0.016),
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
