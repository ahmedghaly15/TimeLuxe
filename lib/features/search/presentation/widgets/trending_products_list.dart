import 'package:flutter/material.dart';
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
      height: 172,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 22),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => TrendingProductItem(
          cubit: cubit,
          model: AppConstants.trendingProducts[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 26),
        itemCount: AppConstants.trendingProducts.length,
      ),
    );
  }
}
