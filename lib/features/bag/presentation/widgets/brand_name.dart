import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';

import 'package:time_luxe/features/bag/presentation/widgets/done_square.dart';

import '../../../../core/global/app_text_styles.dart';

class BrandName extends StatefulWidget {
  const BrandName({
    super.key,
  });

  @override
  State<BrandName> createState() => _BrandNameState();
}

class _BrandNameState extends State<BrandName> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const DoneSquare(),
        SizedBox(width: SizeConfig.screenWidth! * 0.039),
        Text(
          "rolex".toUpperCase(),
          style: AppTextStyles.textStyle18.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
