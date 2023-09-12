import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../core/global/app_colors.dart';

import '../../../../core/models/watch_model.dart';
import 'chat_and_add_to_cart_button.dart';
import 'product_info.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.model});

  final WatchModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.gradientColors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: <Widget>[
          ProductInfo(model: model),
          const Spacer(flex: 2),
          const ChatAndAddToCartButton(),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
