import 'package:flutter/material.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_text_styles.dart';
import '../../../../core/models/watch_model.dart';

class TrendingProductItem extends StatelessWidget {
  const TrendingProductItem({
    super.key,
    required this.model,
  });

  final WatchModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 172,
      width: 115,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: AppColors.primaryColor,
          width: 3,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            model.imageUrl!,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            model.name!,
            style: AppTextStyles.textStyle15.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(flex: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: <Widget>[
                Text(
                  "\$${model.price!}",
                  style: AppTextStyles.textStyle15.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.shopping_cart_rounded,
                    color: Colors.white,
                    size: 19,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 19,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
