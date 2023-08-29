import 'package:flutter/material.dart';
import 'package:time_luxe/core/global/app_text_styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Home",
          style: AppTextStyles.textStyle32,
        ),
      ),
    );
  }
}
