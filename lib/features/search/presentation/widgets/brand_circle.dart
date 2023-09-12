import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/global/app_colors.dart';

class BrandCircle extends StatelessWidget {
  const BrandCircle({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72.w,
      height: 72.w,
      margin: EdgeInsets.only(left: 8.w),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
        border: Border.all(
          color: AppColors.darkGreen,
          width: 2,
        ),
      ),
      child: Center(
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          width: 60.w,
        ),
      ),
    );
  }
}
