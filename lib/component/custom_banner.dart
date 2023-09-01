import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/component/custom_outlined_button.dart';

class MyBanner extends StatelessWidget {
  const MyBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight! * 0.25,
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('assets/images/home_watch_image.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "New collections in\n2023",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                CustomOutlinedButton(
                  onTap: () {
                    // To Do
                  },
                  text: "Shop Now",
                  color: Colors.white,
                  textColor: Colors.white,
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
