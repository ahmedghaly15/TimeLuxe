import 'package:flutter/material.dart';

import '../../../../../core/global/app_colors.dart';

class VisibilityIconButton extends StatelessWidget {
  const VisibilityIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  final void Function()? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: IconButton(
        splashColor: AppColors.primaryColor,
        onPressed: onPressed,
        icon: Icon(icon),
      ),
    );
  }
}
