import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:time_luxe/component/watch_card.dart';

class SellingFast extends StatelessWidget {
  const SellingFast({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text("Selling fast ",
                style: TextStyle(
                  fontSize: 27,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                )),
            SvgPicture.asset('assets/icons/noto_fire.svg'),
          ],
        ),
        const SizedBox(height: 18),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              WatchCard(
                onTap: () {
                  // To Do
                },
                imageUrl: 'assets/images/watch1.jpg',
              ),
              const SizedBox(
                width: 10,
              ),
              WatchCard(
                onTap: () {
                  // To Do
                },
                imageUrl: 'assets/images/watch2.jpg',
              ),
              const SizedBox(
                width: 10,
              ),
              WatchCard(
                onTap: () {
                  // To Do
                },
                imageUrl: 'assets/images/watch3.jpg',
              ),
              const SizedBox(
                width: 10,
              ),
              WatchCard(
                onTap: () {
                  // To Do
                },
                imageUrl: 'assets/images/watch4.jpg',
              ),
              const SizedBox(
                width: 10,
              ),
              WatchCard(
                onTap: () {
                  // To Do
                },
                imageUrl: 'assets/images/watch5.jpg',
              ),
              const SizedBox(
                width: 10,
              ),
              WatchCard(
                onTap: () {
                  // To Do
                },
                imageUrl: 'assets/images/watch6.jpg',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
