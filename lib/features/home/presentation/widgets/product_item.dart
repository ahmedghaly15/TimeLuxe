import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/core/global/app_text_styles.dart';

import 'package:time_luxe/core/models/watch_model.dart';
import 'package:time_luxe/features/product_details/presentation/views/product_details_view.dart';

import '../../../../TimeLuxe/presentation/view/manager/time_luxe_cubit.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.cubit,
    required this.model,
  });

  final WatchModel model;
  final TimeLuxeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CustomNavigator.navigateTo(
        screen: () => ProductDetailsView(model: model),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                width: 180.w,
                height: 140.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18.r),
                  child: Hero(
                    tag: model.id!,
                    child: Image.asset(
                      model.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 7.w,
                child: IconButton(
                  onPressed: () {
                    if (cubit.favorites.any((element) => element == model)) {
                      cubit.removeFromFav(model);
                    } else {
                      cubit.addToFav(model);
                    }
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: cubit.favorites.any((element) => element == model)
                        ? Colors.red
                        : Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.01),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                model.name!,
                style: AppTextStyles.textStyle15.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "\$${model.price!}",
                style: AppTextStyles.textStyle15.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
