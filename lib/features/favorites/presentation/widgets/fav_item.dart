import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            child: GestureDetector(
              onTap: () => CustomNavigator.navigateTo(
                screen: () => ProductDetailsView(model: favItem),
              ),
              child: Hero(
                tag: favItem.id!,
                child: Image.asset(
                  favItem.image!,
                  fit: BoxFit.cover,
                  height: 152,
                  width: 159,
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
                  color: Colors.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              Row(
                children: <Widget>[
                  Text(
                    "\$${favItem.price!}",
                    style: AppTextStyles.textStyle20.copyWith(
                        fontWeight: FontWeight.w900, color: Colors.white),
                  ),
                  const SizedBox(width: 25),
                  GestureDetector(
                    onTap: () => cubit.addToBag(favItem),
                    child: const Icon(
                      Icons.shopping_cart_rounded,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
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
