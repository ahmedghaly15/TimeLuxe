import 'package:flutter/material.dart';
import 'package:time_luxe/features/bag/bag_screen.dart';
import 'package:time_luxe/features/home/presentation/widgets/home_body.dart';
import 'package:time_luxe/features/profile/profile_screen.dart';
import 'package:time_luxe/features/search/search_screen.dart';

Color green = const Color(0xFF0B832D);
Color white = const Color(0xffd9d9d9);
Color backGroundColor = const Color(0xFFA9B9B0);
List<Color> gradientBackGroundColors = [
  const Color.fromRGBO(170, 187, 176, 1.0), // 100% opacity
  const Color.fromRGBO(106, 223, 153, 0.72), // 72% opacity
  const Color.fromRGBO(210, 246, 224, 0.79), // 79% opacity
];

List<Widget> body = const [
  HomeBody(),
  SearchScreen(),
  BagScreen(),
  ProfileScreen(),
];
