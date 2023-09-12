import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/core/global/app_text_styles.dart';
import 'package:time_luxe/features/home/presentation/widgets/custom_outlined_button.dart';
import 'package:time_luxe/core/global/app_assets.dart';

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
            image: DecorationImage(
              image: AssetImage(AppAssets.homeBanner),
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
                Text(
                  "New collections in\n2023",
                  style: AppTextStyles.textStyle32.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.015),
                CustomOutlinedButton(
                  onTap: () {
                    // To Do
                  },
                  text: "Shop Now",
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
