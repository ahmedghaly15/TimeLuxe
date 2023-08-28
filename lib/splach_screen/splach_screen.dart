import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:time_luxe/constants.dart';
import 'package:time_luxe/welcome_screen/welcome_screen.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    super.initState();

    // Delay for 3 seconds and then navigate to the home screen
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (_, __, ___) => const WelcomeScreen(),
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Time",
              style: TextStyle(
                color: Colors.white,
                // fontFamily: 'Inter',
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
                // fontFamily: 'Inter',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: SvgPicture.asset(
                      'assets/icons/tabler_time-duration-10.svg'),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: SvgPicture.asset(
                      'assets/icons/tabler_time-duration-15.svg'),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: SvgPicture.asset(
                      'assets/icons/tabler_time-duration-30.svg'),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: SvgPicture.asset(
                      'assets/icons/tabler_time-duration-45.svg'),
                ),
                SvgPicture.asset('assets/icons/tabler_time-duration-60.svg'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
