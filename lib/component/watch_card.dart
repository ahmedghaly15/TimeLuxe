import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WatchCard extends StatefulWidget {
  WatchCard({super.key, required this.onTap, required this.imageUrl});

  final VoidCallback onTap;
  final String imageUrl;

  @override
  State<WatchCard> createState() => _WatchCardState();
}

class _WatchCardState extends State<WatchCard> {
  Color favIconColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 180,
                height: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.asset(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 7,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (favIconColor == Colors.white) {
                        favIconColor = Colors.red;
                      } else {
                        favIconColor = Colors.white;
                      }
                    });
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: favIconColor,
                  ),
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
