import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'welcome_container.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/watch_background.png',
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0.w,
            vertical: 30.h,
          ),
          child: const WelcomeContainer(),
        ),
      ],
    );
  }
}
