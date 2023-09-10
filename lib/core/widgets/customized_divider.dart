import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';

class CustomizedDivider extends StatelessWidget {
  const CustomizedDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomDivider(
      color: Colors.white,
      height: 0.5,
      width: SizeConfig.screenWidth,
    );
  }
}
