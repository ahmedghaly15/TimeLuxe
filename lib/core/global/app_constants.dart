import 'dart:math';

import 'package:time_luxe/core/global/app_assets.dart';
import 'package:time_luxe/core/models/bag_model.dart';

import '../models/watch_model.dart';

abstract class AppConstants {
  static int randomId() {
    Random random = Random();

    // Generate a random integer between 0 and 100 (inclusive)
    int randomNumber = random.nextInt(101);

    return randomNumber;
  }

  static List<WatchModel> trendingProducts = <WatchModel>[
    WatchModel(
      id: randomId(),
      name: "Lady Datejust",
      image: AppAssets.ladyDateJust,
      price: 177.5,
    ),
    WatchModel(
      id: randomId(),
      name: "1908",
      image: AppAssets.product1908,
      price: 195.8,
    ),
    WatchModel(
      id: randomId(),
      name: "Yatch Master",
      image: AppAssets.yachtMaster,
      price: 188.7,
    ),
  ];

  static List<BagModel> bagItems = <BagModel>[
    BagModel(
      id: randomId(),
      name: "Rolex Daytona stainless",
      image: AppAssets.bag1,
      price: 18.32,
      color: "Sulphur",
    ),
    BagModel(
      id: randomId(),
      name: "Rolex Yacht-Master",
      image: AppAssets.bag2,
      price: 36.11,
      color: "Sulfur Madhhab",
    ),
    BagModel(
      id: randomId(),
      name: "Rolxe",
      image: AppAssets.bag3,
      price: 25.16,
      color: "Brown",
    ),
  ];
}
