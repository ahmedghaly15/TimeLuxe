import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/global/app_assets.dart';
import '../../../../core/global/app_colors.dart';
import 'details_icon_text_button.dart';

class ChatAndAddToCartButton extends StatelessWidget {
  const ChatAndAddToCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      width: 332.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(19.r)),
      ),
      child: Row(
        children: <Widget>[
          DetailsIconTextButton(
            onPressed: () {},
            text: 'Chat',
            icon: SvgPicture.asset(AppAssets.chat),
          ),
          const Spacer(),
          DetailsIconTextButton(
            onPressed: () {},
            text: "Add to Cart",
            icon: SvgPicture.asset(
              AppAssets.bag,
              height: 20.h,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
