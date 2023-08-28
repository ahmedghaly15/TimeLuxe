import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../../core/global/app_text_styles.dart';

class LoginWithSocialButton extends StatelessWidget {
  const LoginWithSocialButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.iconColor = Colors.black,
  });

  final String text;
  final String icon;
  final Color? iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
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
            color: iconColor,
          ),
          child: Text(
            text,
            style: AppTextStyles.textStyle16,
          ),
        ),
      ),
    );
  }
}
