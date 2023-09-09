import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../TimeLuxe/presentation/view/manager/time_luxe_cubit.dart';
import '../../../../core/global/app_constants.dart';
import '../../../../core/global/app_text_styles.dart';
import 'brand_name.dart';
import 'order_item.dart';

class BagProductsList extends StatelessWidget {
  const BagProductsList({
    super.key,
    required this.cubit,
  });

  final TimeLuxeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: AppConstants.bagItems.isNotEmpty,
      builder: (context) => Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const BrandName(),
            const SizedBox(height: 32),
            Column(
              children: List.generate(
                AppConstants.bagItems.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: OrderItem(
                    cubit: cubit,
                    bagProduct: AppConstants.bagItems[index],
                    index: index,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      fallback: (context) => Container(
        margin: EdgeInsets.only(top: SizeConfig.screenHeight! * 0.3),
        child: Center(
          child: Text(
            "No products in the Bag yet,\nExplore products to add one",
            style: AppTextStyles.textStyle18.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
