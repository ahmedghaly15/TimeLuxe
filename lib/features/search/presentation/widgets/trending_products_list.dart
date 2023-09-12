import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_cubit.dart';

import '../../../../core/global/app_constants.dart';
import 'trending_product_item.dart';

class TrendingProductsList extends StatelessWidget {
  const TrendingProductsList({
    super.key,
    required this.cubit,
  });

  final TimeLuxeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => TrendingProductItem(
          cubit: cubit,
          model: AppConstants.trendingProducts[index],
        ),
        separatorBuilder: (context, index) => SizedBox(width: 26.w),
        itemCount: AppConstants.trendingProducts.length,
      ),
    );
  }
}
