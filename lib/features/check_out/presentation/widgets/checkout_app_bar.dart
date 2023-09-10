import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../core/global/app_assets.dart';
import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_text_styles.dart';

class CheckoutAppBar extends StatelessWidget {
  const CheckoutAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: SizeConfig.screenHeight! * 0.07,
        bottom: SizeConfig.screenHeight! * 0.02,
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            padding: const EdgeInsets.only(left: 71, right: 40),
            icon: SvgPicture.asset(
              AppAssets.back,
              color: AppColors.primaryColor,
            ),
            onPressed: () => CustomNavigator.getBack(),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: AppTextStyles.textStyle32.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
