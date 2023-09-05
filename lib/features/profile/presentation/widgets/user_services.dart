import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../core/global/app_assets.dart';
import '../../../../core/global/app_colors.dart';
import 'user_service.dart';

class UserServices extends StatelessWidget {
  const UserServices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: SizeConfig.screenWidth,
      margin: const EdgeInsets.symmetric(horizontal: 9.0),
      padding: const EdgeInsets.only(
        right: 18,
        left: 18,
        top: 13,
        bottom: 7,
      ),
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        children: <Widget>[
          UserService(
            onTap: () {}, // TODO: navigate to Bag Screen
            title: 'My Orders',
            icon: AppAssets.orderApproveIcon,
          ),
          const Spacer(flex: 1),
          const CustomVerticalDivider(
            color: Colors.white,
            width: 1,
            height: 76,
          ),
          const Spacer(flex: 2),
          UserService(
            onTap: () {},
            title: 'Promo Code',
            icon: AppAssets.promoIcon,
          ),
          const Spacer(flex: 2),
          const CustomVerticalDivider(
            color: Colors.white,
            width: 1,
            height: 76,
          ),
          const Spacer(flex: 1),
          UserService(
            onTap: () {},
            title: 'Following',
            icon: AppAssets.userFollowingIcon,
          ),
        ],
      ),
    );
  }
}
