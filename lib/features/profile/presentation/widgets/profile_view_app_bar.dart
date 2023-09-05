import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/global/app_assets.dart';
import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_text_styles.dart';

class ProfileViewAppBar extends StatelessWidget {
  const ProfileViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          Text(
            "Profile",
            style: AppTextStyles.textStyle32.copyWith(
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
          const Spacer(),
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
    );
  }
}
