import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/global/app_assets.dart';
import '../../../../core/global/app_colors.dart';
import '../../../../core/global/app_text_styles.dart';

class ChatAndAddToCartButton extends StatelessWidget {
  const ChatAndAddToCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: 372,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(19)),
      ),
      child: Row(
        children: <Widget>[
          TextButton.icon(
            onPressed: () {},
            icon: SvgPicture.asset(AppAssets.chat),
            label: Text(
              "Chat",
              style: AppTextStyles.textStyle16.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          const Spacer(),
          TextButton.icon(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppAssets.bag,
              height: 24,
              color: Colors.white,
            ),
            label: Text(
              "Add to Cart",
              style: AppTextStyles.textStyle16.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
