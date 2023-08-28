import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';

import 'package:time_luxe/component/custom_button.dart';
import 'package:time_luxe/constants.dart';
import 'package:time_luxe/features/auth/sign_in/presentation/views/sign_in_view.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/watch_background.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton(
                              onTap: () {
                                CustomNavigator.navigateTo(
                                  screen: () => const SignInView(),
                                );
                              },
                              text: "Sign In",
                              color: white,
                              textColor: Colors.black,
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            CustomButton(
                              onTap: () {
                                // TODO: navigate to SignUpView
                              },
                              text: "Get Started",
                              color: green,
                              textColor: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
