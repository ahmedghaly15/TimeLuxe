import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    Key? key,
    required this.context,
    this.onPressedGallery,
    this.onPressedCamera,
    required this.type,
  }) : super(key: key);

  final BuildContext context;
  final void Function()? onPressedGallery;
  final void Function()? onPressedCamera;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0.h),
      child: BottomSheet(
        enableDrag: true,
        onClosing: () => CustomNavigator.getBack(),
        builder: (context) {
          return ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 5.h,
            ),
            children: <Widget>[
              SizedBox(height: SizeConfig.screenHeight! * 0.008),
              Text(
                "Pick $type Picture",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  letterSpacing: 0.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: onPressedGallery,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const CircleBorder(),
                      fixedSize: Size(150.w, 130.h),
                    ),
                    child: Image.asset(
                      'assets/images/image_change/add_image.png',
                      width: 180.w,
                      height: 100.h,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: onPressedCamera,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const CircleBorder(),
                      fixedSize: Size(150.w, 130.h),
                    ),
                    child: Image.asset(
                      'assets/images/image_change/camera.png',
                      width: 180.w,
                      height: 100.h,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
