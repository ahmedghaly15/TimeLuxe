import 'package:flutter/material.dart';

import '../../../../core/global/app_assets.dart';
import '/features/check_out/presentation/widgets/payment_method.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          PaymentMethod(methodLogo: AppAssets.mastercard),
          PaymentMethod(methodLogo: AppAssets.visa),
          PaymentMethod(methodLogo: AppAssets.paypal),
        ],
      ),
    );
  }
}
