import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../notifications/presentation/views/notifications_view.dart';
import 'profile_icon_text_button.dart';

class GeneralSettings extends StatelessWidget {
  const GeneralSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ProfileIconTextButton(
            onPressed: () {},
            text: "My account",
            icon: Icons.person,
          ),
          ProfileIconTextButton(
            onPressed: () {},
            text: "Payment methods",
            icon: Icons.payment,
          ),
          ProfileIconTextButton(
            onPressed: () {},
            text: "My address",
            icon: Icons.location_on,
          ),
          ProfileIconTextButton(
            onPressed: () => CustomNavigator.navigateAndFinish(
              screen: () => const NotificationsView(),
            ),
            text: "Notifications",
            icon: Icons.notifications,
          ),
        ],
      ),
    );
  }
}
