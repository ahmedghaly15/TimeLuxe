import 'package:flutter/material.dart';

import '../../../../core/global/app_assets.dart';
import 'brand_circle.dart';

class BrandsList extends StatelessWidget {
  const BrandsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BrandCircle(image: AppAssets.breitling),
          BrandCircle(image: AppAssets.omega),
          BrandCircle(image: AppAssets.swatch),
          BrandCircle(image: AppAssets.rolex),
        ],
      ),
    );
  }
}
