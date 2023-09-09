import 'dart:math';

import 'package:time_luxe/core/global/app_assets.dart';

import '../models/watch_model.dart';

abstract class AppConstants {
  static int randomId() {
    Random random = Random();

    // Generate a random integer between 0 and 100 (inclusive)
    int randomNumber = random.nextInt(1001);

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

  static List<WatchModel> bagItems = <WatchModel>[
    WatchModel(
      id: randomId(),
      name: "Rolex Daytona stainless",
      image: AppAssets.bag1,
      price: 18.32,
      color: "Sulphur",
    ),
    WatchModel(
      id: randomId(),
      name: "Rolex Yacht-Master",
      image: AppAssets.bag2,
      price: 36.11,
      color: "Sulfur Madhhab",
    ),
    WatchModel(
      id: randomId(),
      name: "Rolxe",
      image: AppAssets.bag3,
      price: 25.16,
      color: "Brown",
    ),
  ];

  static List<WatchModel> sellingFast = <WatchModel>[
    WatchModel(
      id: randomId(),
      name: "Tangomat",
      image: AppAssets.sellingFastWatch1,
      price: 30.17,
    ),
    WatchModel(
      id: randomId(),
      name: "Rolxe",
      image: AppAssets.sellingFastWatch2,
      price: 23.19,
    ),
    WatchModel(
      id: randomId(),
      name: "Tangomat",
      image: AppAssets.sellingFastWatch3,
      price: 30.17,
    ),
    WatchModel(
      id: randomId(),
      name: "Rolxe",
      image: AppAssets.sellingFastWatch4,
      price: 23.19,
    ),
    WatchModel(
      id: randomId(),
      name: "Tangomat",
      image: AppAssets.sellingFastWatch5,
      price: 30.17,
    ),
    WatchModel(
      id: randomId(),
      name: "Rolxe",
      image: AppAssets.sellingFastWatch6,
      price: 23.19,
    ),
  ];

  static List<WatchModel> popularProducts = <WatchModel>[
    WatchModel(
      id: randomId(),
      image: AppAssets.popularProduct1,
    ),
    WatchModel(
      id: randomId(),
      image: AppAssets.popularProduct2,
    ),
    WatchModel(
      id: randomId(),
      image: AppAssets.popularProduct3,
    ),
    WatchModel(
      id: randomId(),
      image: AppAssets.popularProduct4,
    ),
    WatchModel(
      id: randomId(),
      image: AppAssets.popularProduct5,
    ),
    WatchModel(
      id: randomId(),
      image: AppAssets.popularProduct6,
    ),
  ];
}
