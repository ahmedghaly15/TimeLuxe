import 'package:animate_do/animate_do.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_cubit.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_states.dart';

import 'package:time_luxe/core/global/app_text_styles.dart';
import 'package:time_luxe/features/product_details/presentation/views/product_details_view.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/models/watch_model.dart';
import '../../../../core/widgets/search_text_field.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeLuxeCubit, TimeLuxeStates>(
        builder: (context, state) {
      TimeLuxeCubit cubit = TimeLuxeCubit.getObject(context);

      return Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        padding: const EdgeInsets.only(top: 32),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.gradientColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: FadeInUp(
            from: 20,
            duration: const Duration(milliseconds: 500),
            child: Column(
              children: <Widget>[
                SizedBox(height: SizeConfig.screenHeight! * 0.05),
                SearchTextField(
                  onTap: () {},
                  hint: "Favorites",
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.06),
                ConditionalBuilder(
                  condition: cubit.favorites.isNotEmpty,
                  builder: (context) => ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => FavItem(
                      favItem: cubit.favorites[index],
                      cubit: cubit,
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 64),
                    itemCount: cubit.favorites.length,
                  ),
                  fallback: (context) => Container(
                    margin:
                        EdgeInsets.only(top: SizeConfig.screenHeight! * 0.3),
                    child: Center(
                      child: Text(
                        "No products in the Favorites yet,\nExplore products to add one",
                        style: AppTextStyles.textStyle18.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

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
