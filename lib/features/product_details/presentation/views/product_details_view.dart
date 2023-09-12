import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reusable_components/reusable_components.dart';

import 'package:time_luxe/core/global/app_text_styles.dart';

import 'package:time_luxe/features/product_details/presentation/widgets/product_details_view_body.dart';

import '../../../../core/global/app_assets.dart';
import '../../../../core/global/app_colors.dart';

import '../../../../core/models/watch_model.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.model});

  final WatchModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ProductDetailsViewBody(model: model),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.grey,
      elevation: 0,
      title: Text(
        "Back",
        style: AppTextStyles.textStyle24.copyWith(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      leading: IconButton(
        padding: EdgeInsets.only(left: 20.w),
        icon: SvgPicture.asset(
          AppAssets.back,
          color: AppColors.primaryColor,
        ),
        onPressed: () => CustomNavigator.getBack(),
      ),
    );
  }
}
