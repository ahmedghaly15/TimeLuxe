import 'package:flutter/material.dart';
import 'package:time_luxe/component/watch_card.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Popular products",
          style: TextStyle(
            fontSize: 27,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 18),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WatchCard(
                  onTap: () {
                    // To Do
                  },
                  imageUrl: 'assets/images/product1.jpg',
                ),
                const SizedBox(
                  width: 10,
                ),
                WatchCard(
                  onTap: () {
                    // To Do
                  },
                  imageUrl: 'assets/images/product2.jpg',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WatchCard(
                  onTap: () {
                    // To Do
                  },
                  imageUrl: 'assets/images/product2.jpg',
                ),
                const SizedBox(
                  width: 10,
                ),
                WatchCard(
                  onTap: () {
                    // To Do
                  },
                  imageUrl: 'assets/images/product1.jpg',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
