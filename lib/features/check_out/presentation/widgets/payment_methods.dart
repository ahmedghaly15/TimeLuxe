import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/global/app_assets.dart';
import '/features/check_out/presentation/widgets/payment_method.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: const Row(
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
