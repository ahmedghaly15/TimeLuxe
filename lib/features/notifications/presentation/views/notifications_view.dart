import 'package:flutter/material.dart';
import 'package:time_luxe/features/notifications/presentation/widgets/notifications_view_body.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NotificationsViewBody(),
    );
  }
}
