import 'package:flutter/material.dart';

import '../global/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.actions,
    required this.padding,
  });

  final String title;
  final Widget actions;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: AppTextStyles.textStyle32.copyWith(
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          actions,
        ],
      ),
    );
  }
}
