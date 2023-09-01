import 'package:flutter/material.dart';

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
        const Padding(
          padding: EdgeInsets.all(25.0),
          child: WelcomeContainer(),
        ),
      ],
    );
  }
}
