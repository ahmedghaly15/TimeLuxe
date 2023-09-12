import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import 'package:time_luxe/core/widgets/fall_back_text.dart';

import '../../../../TimeLuxe/presentation/view/manager/time_luxe_cubit.dart';
import '../../../../core/global/app_constants.dart';

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
        padding: EdgeInsets.only(bottom: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const BrandName(),
            SizedBox(height: SizeConfig.screenHeight! * 0.032),
            Column(
              children: List.generate(
                AppConstants.bagItems.length,
                (index) => Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
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
      fallback: (context) => const FallBackText(
        text: "No products in the Bag yet,\nExplore products to add one",
      ),
    );
  }
}
