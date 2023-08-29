import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static const TextStyle textStyle32 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle textStyle13 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.normal,
  );

  static TextStyle hintStyle = TextStyle(
    fontSize: 16,
    color: const Color(0xFF676161).withOpacity(0.88),
    fontWeight: FontWeight.w600,
  );

  static TextStyle textFieldStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}
