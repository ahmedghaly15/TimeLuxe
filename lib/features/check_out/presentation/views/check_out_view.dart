import 'package:flutter/material.dart';
import 'package:time_luxe/features/check_out/presentation/widgets/check_out_view_body.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key, required this.subtotal});

  final String subtotal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CheckOutViewBody(subtotal: subtotal),
    );
  }
}
