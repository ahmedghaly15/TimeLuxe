import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../../core/global/app_colors.dart';
import '../../../../../core/global/app_text_styles.dart';

class LoginWithSocialButton extends StatelessWidget {
  const LoginWithSocialButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    required this.isActive,
  });

  final String text;
  final String icon;

  final VoidCallback onPressed;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            height: 48,
            width: isActive ? 305 : 0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            child: Container(
              decoration: BoxDecoration(
                color: isActive
                    ? AppColors.primaryColor
                    : AppColors.authScaffoldBackgroundColor,
                borderRadius: const BorderRadius.all(Radius.circular(14)),
                border: isActive
                    ? Border.all(
                        color: AppColors.primaryColor,
                        width: 2,
                      )
                    : Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: MyCustomButton(
              onPressed: onPressed,
              height: 48,
              width: 305,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              radius: 14,
              hasPrefix: true,
              prefixWidget: SvgPicture.asset(
                icon,
                color: isActive ? Colors.white : Colors.black,
              ),
              child: Text(
                text,
                style: isActive
                    ? AppTextStyles.textStyle16.copyWith(color: Colors.white)
                    : AppTextStyles.textStyle16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
