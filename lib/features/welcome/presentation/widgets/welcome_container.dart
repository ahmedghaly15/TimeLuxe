import 'package:flutter/material.dart';

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
          width: 385,
          height: 327,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.78),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  "Welcome to time",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Text(
                  "luxe",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Get exclusive limited watches that only\n you have! Made by famous brands in\n the world ",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 28,
                ),
                Container(
                  height: 4,
                  width: 34,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Divider(color: Colors.green),
                ),
                const SizedBox(
                  height: 26,
                ),
                const SignInOrGetStartedButtons(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
