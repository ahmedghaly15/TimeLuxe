import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/core/global/app_assets.dart';
import 'package:time_luxe/features/profile/presentation/views/edit_profile_view.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_text_styles.dart';
import '../../../../core/models/user_model.dart';

class CurrentUserInfo extends StatelessWidget {
  const CurrentUserInfo({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 45.r,
            backgroundImage: NetworkImage(user.image!),
            backgroundColor: AppColors.primaryColor,
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                userName(),
                style: AppTextStyles.textStyle24.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                user.email!,
                style: AppTextStyles.textStyle13,
              ),
            ],
          ),
          const Spacer(flex: 2),
          GestureDetector(
            onTap: () => CustomNavigator.navigateTo(
              screen: () => const EditProfileView(),
            ),
            child: SvgPicture.asset(
              AppAssets.edit,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  String userName() {
    if (user.name!.length > 11) {
      return "${user.name!.substring(0, 11)}..";
    } else {
      return user.name!;
    }
  }
}
