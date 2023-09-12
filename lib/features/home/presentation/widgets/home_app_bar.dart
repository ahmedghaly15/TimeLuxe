import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:time_luxe/core/global/app_assets.dart';
import 'package:time_luxe/core/global/app_text_styles.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Dipstore. ",
            style: AppTextStyles.textStyle32.copyWith(
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(AppAssets.thinEmail),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(AppAssets.bellRing),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
