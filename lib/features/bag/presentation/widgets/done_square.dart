import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/global/app_assets.dart';
import '../../../../core/global/app_colors.dart';

class DoneSquare extends StatefulWidget {
  const DoneSquare({super.key});

  @override
  State<DoneSquare> createState() => _DoneSquareState();
}

class _DoneSquareState extends State<DoneSquare> {
  Widget? child;
  Color backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (child == null) {
            child = SvgPicture.asset(AppAssets.done);
            backgroundColor = AppColors.primaryColor;
          } else {
            child = null;
            backgroundColor = Colors.white;
          }
        });
      },
      child: Container(
        height: 24,
        width: 24,
        margin: const EdgeInsets.only(left: 22),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: child,
      ),
    );
  }
}
