import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/core/global/app_constants.dart';

import '../../../../TimeLuxe/presentation/view/manager/time_luxe_cubit.dart';
import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_text_styles.dart';
import '../../../../core/models/watch_model.dart';
import '../../../product_details/presentation/views/product_details_view.dart';

class FavItem extends StatelessWidget {
  const FavItem({
    super.key,
    required this.favItem,
    required this.cubit,
  });

  final WatchModel favItem;
  final TimeLuxeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25.r)),
            child: GestureDetector(
              onTap: () => CustomNavigator.navigateTo(
                screen: () => ProductDetailsView(model: favItem),
              ),
              child: Hero(
                tag: favItem.id!,
                child: Image.asset(
                  favItem.image!,
                  fit: BoxFit.cover,
                  height: 132.h,
                  width: 139.w,
                ),
              ),
            ),
          ),
          const Spacer(flex: 1),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                favItem.name!,
                style: AppTextStyles.textStyle24.copyWith(
                  fontWeight: FontWeight.w900,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.016),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "\$${favItem.price!}",
                    style: AppTextStyles.textStyle20.copyWith(
                        fontWeight: FontWeight.w900, color: Colors.white),
                  ),
                  SizedBox(width: SizeConfig.screenWidth! * 0.055),
                  GestureDetector(
                    onTap: () {
                      if (AppConstants.bagItems
                          .any((element) => element == favItem)) {
                        cubit.removeBagProduct(favItem);
                      } else {
                        cubit.addToBag(favItem);
                      }
                    },
                    child: Icon(
                      Icons.shopping_cart_rounded,
                      color: AppConstants.bagItems
                              .any((element) => element == favItem)
                          ? AppColors.primaryColor
                          : Colors.white,
                    ),
                  ),
                  SizedBox(width: SizeConfig.screenWidth! * 0.02),
                  GestureDetector(
                    onTap: () => cubit.removeFromFav(favItem),
                    child: const Icon(
                      Icons.favorite,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
