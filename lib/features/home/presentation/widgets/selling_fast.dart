import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_cubit.dart';

import 'package:time_luxe/core/global/app_assets.dart';
import 'package:time_luxe/core/global/app_constants.dart';
import 'package:time_luxe/core/global/app_text_styles.dart';

import 'product_item.dart';

class SellingFast extends StatelessWidget {
  const SellingFast({super.key, required this.cubit});

  final TimeLuxeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              "Selling fast ",
              style: AppTextStyles.textStyle27,
            ),
            SvgPicture.asset(AppAssets.fireEmoji),
          ],
        ),
        SizedBox(height: SizeConfig.screenHeight! * 0.018),
        SizedBox(
          height: 195.h,
          child: ListView.separated(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ProductItem(
              cubit: cubit,
              model: AppConstants.sellingFast[index],
            ),
            separatorBuilder: (context, index) => SizedBox(width: 10.w),
            itemCount: AppConstants.sellingFast.length,
          ),
        ),
      ],
    );
  }
}
