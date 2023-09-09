import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../core/global/app_text_styles.dart';

class OtherSettings extends StatelessWidget {
  const OtherSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 54,
        top: SizeConfig.screenHeight! * 0.01,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Contact Preferences",
            style: AppTextStyles.textStyle20.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.025),
          Text(
            "Terms & Conditions ",
            style: AppTextStyles.textStyle20.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
