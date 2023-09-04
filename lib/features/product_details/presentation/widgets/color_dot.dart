import 'package:flutter/material.dart';

class ColorDot extends StatefulWidget {
  const ColorDot({
    super.key,
    required this.fillClr,
  });

  final Color fillClr;

  @override
  State<ColorDot> createState() => _ColorDotState();
}

class _ColorDotState extends State<ColorDot> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (!isSelected) {
            isSelected = true;
          } else {
            isSelected = false;
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          // 8 padding for left & right
          horizontal: 20.0 / 2.5,
        ),
        height: 38,
        width: 38,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: isSelected
              ? Border.all(
                  color: Colors.white,
                  width: 4,
                )
              : Border.all(
                  color: Colors.transparent,
                  width: 0,
                ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: widget.fillClr,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
