import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_text_styles.dart';

import '../../../../core/models/watch_model.dart';
import 'color_dots_list.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    required this.model,
  });

  final WatchModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight! * 0.7,
      width: SizeConfig.screenWidth,
      decoration: const BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 65),
          Center(
            child: Hero(
              tag: model.id!,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(64)),
                child: Image.asset(
                  model.image!,
                  fit: BoxFit.cover,
                  height: 257,
                  width: 269,
                ),
              ),
            ),
          ),
          const SizedBox(height: 21),
          const ColorDotsList(),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              model.name!,
              style: AppTextStyles.textStyle24.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              "\$${model.price!}",
              style: AppTextStyles.textStyle15.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Text(
              model.description!,
              style: AppTextStyles.textStyle14.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
