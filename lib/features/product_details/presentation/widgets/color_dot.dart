import 'package:flutter/material.dart';

class ColorDot extends StatelessWidget {
  const ColorDot({
    super.key,
    required this.fillClr,
  });

  final Color fillClr;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        // 8 padding for left & right
        horizontal: 20 / 2.5,
      ),
      padding: const EdgeInsets.all(3.0),
      height: 38,
      width: 38,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: fillClr,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
