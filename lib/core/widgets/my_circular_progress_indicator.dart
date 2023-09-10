import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';

import '../global/app_colors.dart';

class MyCircularProgressIndicator extends StatelessWidget {
  const MyCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomCircularProgressIndicator(
      color: AppColors.primaryColor,
      backgroundColor: Colors.white,
    );
  }
}
