import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:time_luxe/core/global/app_assets.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 45,
            backgroundImage: NetworkImage(user.image!),
            backgroundColor: AppColors.primaryColor,
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                user.name!,
                style: AppTextStyles.textStyle24.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                user.email!,
                style: AppTextStyles.textStyle13.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const Spacer(flex: 2),
          GestureDetector(
            onTap: () {
              // TODO: navigate to Update Profile Screen
            },
            child: SvgPicture.asset(
              AppAssets.edit,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
