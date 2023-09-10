import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.only(bottom: 8.0),
      child: BottomSheet(
        enableDrag: true,
        onClosing: () => CustomNavigator.getBack(),
        builder: (context) {
          return ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            children: <Widget>[
              const SizedBox(height: 8),
              Text(
                "Pick $type Picture",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: onPressedGallery,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const CircleBorder(),
                      fixedSize: const Size(180, 130),
                    ),
                    child: Image.asset(
                      'assets/images/image_change/add_image.png',
                      width: 180,
                      height: 100,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: onPressedCamera,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const CircleBorder(),
                      fixedSize: const Size(180, 130),
                    ),
                    child: Image.asset(
                      'assets/images/image_change/camera.png',
                      width: 180,
                      height: 100,
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
