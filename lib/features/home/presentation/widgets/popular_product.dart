import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_cubit.dart';
import 'package:time_luxe/core/global/app_constants.dart';
import 'package:time_luxe/features/home/presentation/widgets/product_item.dart';

import '../../../../core/global/app_text_styles.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key, required this.cubit});

  final TimeLuxeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Popular products",
          style: AppTextStyles.textStyle27,
        ),
        SizedBox(height: SizeConfig.screenHeight! * 0.018),
        GridView.builder(
          itemBuilder: (context, index) => ProductItem(
            cubit: cubit,
            model: AppConstants.popularProducts[index],
          ),
          itemCount: AppConstants.popularProducts.length,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          scrollDirection: Axis.vertical,
          reverse: false,
          primary: true,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          dragStartBehavior: DragStartBehavior.start,
          clipBehavior: Clip.hardEdge,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisExtent: 235,
            mainAxisSpacing: 26,
            crossAxisSpacing: 15,
            childAspectRatio: 3 / 2,
          ),
        ),
      ],
    );
  }
}
