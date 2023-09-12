import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import 'sign_in_or_get_started_buttons.dart';

class WelcomeContainer extends StatelessWidget {
  const WelcomeContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 385.w,
          height: 280.h,
          // padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 15.w),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.78),
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Welcome to time",
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              Text(
                "luxe",
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.01),
              Text(
                "Get exclusive limited watches that only\n you have! Made by famous brands in\n the world ",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w200,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.028),
              Container(
                height: 4.h,
                width: 34.w,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: const Divider(color: Colors.green),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.026),
              const SignInOrGetStartedButtons(),
            ],
          ),
        ),
      ],
    );
  }
}
