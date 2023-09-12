import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_text_styles.dart';

import '../../../../core/models/watch_model.dart';
import 'color_dots_list.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    required this.model,
  });

  final WatchModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight! * 0.72,
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.0.r),
          bottomRight: Radius.circular(50.0.r),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: SizeConfig.screenHeight! * 0.065),
            Center(
              child: Hero(
                tag: model.id!,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(64.r)),
                  child: Image.asset(
                    model.image!,
                    fit: BoxFit.cover,
                    height: 210.h,
                    width: 260.w,
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.021),
            const ColorDotsList(),
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Text(
                model.name!,
                style: AppTextStyles.textStyle24.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.01),
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Text(
                "\$${model.price!}",
                style: AppTextStyles.textStyle15.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.012),
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Text(
                model.description!,
                style: AppTextStyles.textStyle14.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
