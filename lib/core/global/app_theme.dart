import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_luxe/core/global/app_colors.dart';

abstract class AppTheme {
  static ThemeData appTheme() => ThemeData(
        primaryColor: AppColors.primaryColor,
        textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme),
      );
}
