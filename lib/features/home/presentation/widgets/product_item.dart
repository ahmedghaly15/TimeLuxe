import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';

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
              Container(
                width: 180,
                height: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
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
                top: 0,
                right: 7,
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
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                model.name!,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "\$${model.price!}",
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
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
