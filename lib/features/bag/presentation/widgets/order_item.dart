import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/features/product_details/presentation/views/product_details_view.dart';

import '../../../../TimeLuxe/presentation/view/manager/time_luxe_cubit.dart';
import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_text_styles.dart';
import '../../../../core/models/bag_model.dart';
import 'done_square.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.cubit,
    required this.bagProduct,
    required this.index,
  });

  final TimeLuxeCubit cubit;
  final BagModel bagProduct;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: <Widget>[
          Container(
            height: 90,
            width: 66,
            color: const Color(0xFF74d592),
            child: GestureDetector(
              onTap: () => cubit.removeBagProduct(bagProduct, index),
              child: const Icon(
                FontAwesomeIcons.solidTrashCan,
                color: Colors.red,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Row(
          children: <Widget>[
            const DoneSquare(),
            const SizedBox(width: 19),
            SizedBox(
              height: 90,
              width: 66,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: GestureDetector(
                  onTap: () => CustomNavigator.navigateTo(
                    screen: () => ProductDetailsView(model: bagProduct),
                  ),
                  child: Hero(
                    tag: bagProduct.id!,
                    child: Image.asset(bagProduct.image!),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  bagProduct.name ?? "No Name",
                  style: AppTextStyles.textStyle12.copyWith(
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "Color: ${(bagProduct.color) ?? "No Color"}",
                  style: AppTextStyles.textStyle12.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "\$${(bagProduct.price) ?? "No Price"}",
                  style:
                      AppTextStyles.textStyle12.copyWith(color: Colors.white),
                ),
              ],
            ),
            const Spacer(flex: 4),
            GestureDetector(
              onTap: () => cubit.decrement(),
              child: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.white, width: 3),
                ),
                child: const Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              "${cubit.ordersCounter}",
              style: AppTextStyles.textStyle20.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () => cubit.increment(),
              child: const Icon(
                Icons.add_box,
                color: AppColors.primaryColor,
                size: 33,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
