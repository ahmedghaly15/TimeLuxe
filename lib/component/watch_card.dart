import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WatchCard extends StatelessWidget {
  const WatchCard({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 189,
                height: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      18), // Adjust this radius to match the border radius
                  child: Image.asset(
                    "assets/images/watch1.jpg",
                    fit: BoxFit.cover, // Adjust the image fit as needed
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 7,
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/icons/fac_icon.svg'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tangomat",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "\$30.17",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
