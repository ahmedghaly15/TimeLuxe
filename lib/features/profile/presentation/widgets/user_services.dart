import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_cubit.dart';

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
      height: 90.h,
      width: SizeConfig.screenWidth,
      margin: EdgeInsets.symmetric(horizontal: 9.0.w),
      padding: EdgeInsets.only(
        right: 18.w,
        left: 18.w,
        top: 12.h,
        bottom: 7.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      child: Row(
        children: <Widget>[
          UserService(
            onTap: () =>
                TimeLuxeCubit.getObject(context).changeBottomNavToBag(),
            title: 'My Orders',
            icon: AppAssets.orderApproveIcon,
          ),
          const Spacer(flex: 1),
          CustomVerticalDivider(
            color: Colors.white,
            width: 1.w,
            height: 76.h,
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
