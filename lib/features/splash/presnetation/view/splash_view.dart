import 'package:flutter/material.dart';
import 'package:time_luxe/constants.dart';
import 'package:time_luxe/core/global/helper.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/time_luxe_app_view.dart';
import 'package:time_luxe/features/welcome/presentation/views/welcome_view.dart';

import '../../../../core/network/local/cache_helper.dart';
import '../widgets/seconds_circles.dart';

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
      backgroundColor: green,
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
                fontSize: 50,
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
                fontSize: 65,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
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
        navigateAndReplace(const TimeLuxeAppView());
      } else {
        navigateAndReplace(const WelcomeView());
      }
    });
  }

  Future<dynamic> navigateAndReplace(Widget screen) {
    return Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (_, __, ___) => screen,
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }
}
