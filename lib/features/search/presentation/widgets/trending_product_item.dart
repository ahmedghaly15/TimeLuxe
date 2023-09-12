import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_cubit.dart';

import 'package:time_luxe/features/product_details/presentation/views/product_details_view.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_constants.dart';
import '../../../../core/global/app_text_styles.dart';
import '../../../../core/models/watch_model.dart';

class TrendingProductItem extends StatelessWidget {
  const TrendingProductItem({
    super.key,
    required this.model,
    required this.cubit,
  });

  final WatchModel model;
  final TimeLuxeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CustomNavigator.navigateTo(
        screen: () => ProductDetailsView(model: model),
      ),
      child: Container(
        width: SizeConfig.screenWidth! * 0.35,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: AppColors.primaryColor,
            width: 3,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(25)),
        ),
        child: Column(
          children: <Widget>[
            Hero(
              tag: model.id!,
              child: Image.asset(
                model.image!,
                fit: BoxFit.cover,
                width: SizeConfig.screenWidth! * 0.35,
              ),
            ),
            const Spacer(flex: 1),
            Text(
              model.name!,
              style: AppTextStyles.textStyle15.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(flex: 2),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
              child: Row(
                children: <Widget>[
                  Text(
                    "\$${model.price!}",
                    style: AppTextStyles.textStyle15.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      if (AppConstants.bagItems
                          .any((element) => element == model)) {
                        cubit.removeBagProduct(model);
                      } else {
                        cubit.addToBag(model);
                      }
                    },
                    child: Icon(
                      Icons.shopping_cart_rounded,
                      color: AppConstants.bagItems
                              .any((element) => element == model)
                          ? AppColors.primaryColor
                          : Colors.white,
                      size: 19.w,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (cubit.favorites.any((element) => element == model)) {
                        cubit.removeFromFav(model);
                      } else {
                        cubit.addToFav(model);
                      }
                    },
                    child: Icon(
                      cubit.favorites.any((element) => element == model)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: cubit.favorites.any((element) => element == model)
                          ? Colors.red
                          : Colors.white,
                      size: 19.w,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
