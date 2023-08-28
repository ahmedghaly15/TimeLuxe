import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../../core/global/app_text_styles.dart';

class OrLoginWith extends StatelessWidget {
  const OrLoginWith({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        Expanded(
          child: CustomDivider(
            color: Colors.black,
            height: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Or login with",
            style: AppTextStyles.textStyle16,
          ),
        ),
        Expanded(
          child: CustomDivider(
            color: Colors.black,
            height: 1,
          ),
        ),
      ],
    );
  }
}
