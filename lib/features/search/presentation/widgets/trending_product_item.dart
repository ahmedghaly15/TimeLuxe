import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';

import 'package:time_luxe/features/product_details/presentation/views/product_details_view.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_text_styles.dart';
import '../../../../core/models/watch_model.dart';

class TrendingProductItem extends StatefulWidget {
  const TrendingProductItem({
    super.key,
    required this.model,
  });

  final WatchModel model;

  @override
  State<TrendingProductItem> createState() => _TrendingProductItemState();
}

// TODO: modify fav icon color and make it add the item to fav screen

class _TrendingProductItemState extends State<TrendingProductItem> {
  Color favIconColor = Colors.white;
  Color cartIconColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CustomNavigator.navigateTo(
        screen: () => ProductDetailsView(model: widget.model),
      ),
      child: Container(
        height: 173,
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
          children: <Widget>[
            Hero(
              tag: widget.model.id!,
              child: Image.asset(
                widget.model.image!,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.model.name!,
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
                    "\$${widget.model.price!}",
                    style: AppTextStyles.textStyle15.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (cartIconColor == Colors.white) {
                          cartIconColor = AppColors.lightGreen;
                        } else {
                          cartIconColor = Colors.white;
                        }
                      });
                    },
                    child: Icon(
                      Icons.shopping_cart_rounded,
                      color: cartIconColor,
                      size: 19,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (favIconColor == Colors.white) {
                          favIconColor = AppColors.lightGreen;
                        } else {
                          favIconColor = Colors.white;
                        }
                      });
                    },
                    child: Icon(
                      favIconColor == Colors.white
                          ? Icons.favorite_border
                          : Icons.favorite,
                      color: favIconColor,
                      size: 19,
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
