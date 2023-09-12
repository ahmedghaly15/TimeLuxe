import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/features/splash/presnetation/widgets/seconds_circles.dart';

import '../../../../core/network/local/cache_helper.dart';

import '/TimeLuxe/presentation/view/time_luxe_app_view.dart';
import '/core/global/app_colors.dart';
import '../../../../core/utils/helper.dart';
import '/features/welcome/presentation/views/welcome_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    moveToNextView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Time",
              style: TextStyle(
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 7,
                    offset: const Offset(9, 5),
                  )
                ],
                fontSize: 50.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "Luxe",
              style: TextStyle(
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.19),
                    offset: const Offset(2, 5),
                  )
                ],
                fontSize: 65.sp,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.01),
            const SecondsCircles(),
          ],
        ),
      ),
    );
  }

  Future<void> moveToNextView() {
    return Future.delayed(const Duration(seconds: 3), () {
      Helper.uId = CacheHelper.getStringData(key: 'uId');

      if (Helper.uId != null) {
        moveToNext(const TimeLuxeAppView());
      } else {
        moveToNext(const WelcomeView());
      }
    });
  }

  void moveToNext(Widget screen) {
    CustomNavigator.navigateAndFinish(
      screen: () => screen,
      curve: Curves.easeIn,
      transition: Transition.fadeIn,
      duration: const Duration(seconds: 1),
    );
  }
}
