import 'package:flutter/material.dart';

import '../../../../core/global/app_constants.dart';
import 'trending_product_item.dart';

class TrendingProductsList extends StatelessWidget {
  const TrendingProductsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 172,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => TrendingProductItem(
          model: AppConstants.trendingProducts[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 26),
        itemCount: AppConstants.trendingProducts.length,
      ),
    );
  }
}
