import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/global/app_assets.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(AppAssets.mastercard),
          ),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(AppAssets.visa),
          ),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(AppAssets.paypal),
          ),
        ],
      ),
    );
  }
}
