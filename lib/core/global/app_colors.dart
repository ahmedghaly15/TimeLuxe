import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primaryColor = Color(0xFF0B832D);
  static const Color authScaffoldBackgroundColor = Color(0xFFA9B9B0);
  static const Color lightYellow = Color(0xFFEBF1AA);
  static const Color lightGreen = Color(0xFF25CF69);
  static const Color darkGreen = Color(0xFF0A4E1D);
  static const Color grey = Color(0xFFAAB8B0);

  static const Color white = Color(0xffd9d9d9);
  static const Color backGroundColor = Color(0xFFA9B9B0);
  static List<Color> firstGradientColors = const <Color>[
    Color.fromRGBO(170, 187, 176, 1.0), // 100% opacity
    Color.fromRGBO(106, 223, 153, 0.72), // 72% opacity
    Color.fromRGBO(210, 246, 224, 0.79), // 79% opacity
  ];

  static List<Color> secondGradientColors = <Color>[
    const Color(0xFFD9D9D9),
    const Color(0xFF90F1B7).withOpacity(0.72),
  ];
}
