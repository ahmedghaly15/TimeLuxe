import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/global/app_text_styles.dart';

class UserService extends StatelessWidget {
  const UserService({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          child: SvgPicture.asset(
            icon,
            color: Colors.white,
            height: 44,
            width: 44,
          ),
        ),
        const SizedBox(height: 7),
        Text(
          title,
          style: AppTextStyles.textStyle16.copyWith(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
