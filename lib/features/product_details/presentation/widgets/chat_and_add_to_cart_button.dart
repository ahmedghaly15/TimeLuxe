import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/global/app_assets.dart';
import '../../../../core/global/app_colors.dart';
import 'details_icon_text_button.dart';

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
          DetailsIconTextButton(
            onPressed: () {},
            text: 'Chat',
            icon: SvgPicture.asset(AppAssets.chat),
          ),
          const Spacer(),
          DetailsIconTextButton(
            onPressed: () {},
            text: "Add to Cart",
            icon: SvgPicture.asset(
              AppAssets.bag,
              height: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
