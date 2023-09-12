import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/features/product_details/presentation/views/product_details_view.dart';

import '../../../../TimeLuxe/presentation/view/manager/time_luxe_cubit.dart';
import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_text_styles.dart';

import '../../../../core/models/watch_model.dart';
import 'done_square.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.cubit,
    required this.bagProduct,
    required this.index,
  });

  final TimeLuxeCubit cubit;
  final WatchModel bagProduct;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: <Widget>[
          Container(
            height: 70.h,
            width: 66.w,
            color: const Color(0xFF74d592),
            child: GestureDetector(
              onTap: () => cubit.removeBagProduct(bagProduct),
              child: Icon(
                FontAwesomeIcons.solidTrashCan,
                color: Colors.red,
                size: 25.w,
              ),
            ),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(right: 15.w),
        child: Row(
          children: <Widget>[
            const DoneSquare(),
            SizedBox(width: SizeConfig.screenWidth! * 0.039),
            SizedBox(
              height: 70.h,
              width: 50.w,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
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
                  style: AppTextStyles.textStyle12,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "Color: ${(bagProduct.color) ?? "No Color"}",
                  style: AppTextStyles.textStyle12.copyWith(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.005),
                Text(
                  "\$${(bagProduct.price) ?? "No Price"}",
                  style: AppTextStyles.textStyle12,
                ),
              ],
            ),
            const Spacer(flex: 4),
            GestureDetector(
              onTap: () => cubit.decrement(),
              child: Container(
                height: 22.w,
                width: 22.w,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.white, width: 3),
                ),
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 15.w,
                ),
              ),
            ),
            SizedBox(width: SizeConfig.screenWidth! * 0.022),
            Text(
              "${cubit.ordersCounter}",
              style: AppTextStyles.textStyle20.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(width: SizeConfig.screenWidth! * 0.022),
            GestureDetector(
              onTap: () => cubit.increment(),
              child: Icon(
                Icons.add_box,
                color: AppColors.primaryColor,
                size: 33.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
