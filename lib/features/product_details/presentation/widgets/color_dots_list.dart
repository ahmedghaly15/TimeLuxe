import 'package:flutter/material.dart';

import 'color_dot.dart';

class ColorDotsList extends StatelessWidget {
  const ColorDotsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ColorDot(
            fillClr: Color(0xFFDF9C1B),
          ),
          ColorDot(
            fillClr: Color(0xFF6F3705),
          ),
          ColorDot(
            fillClr: Colors.black,
          ),
        ],
      ),
    );
  }
}
