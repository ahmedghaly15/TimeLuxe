import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/features/check_out/presentation/views/my_card_view.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key, required this.methodLogo});

  final String methodLogo;

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  Color borderColor = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (borderColor != Colors.red) {
          setState(() {
            borderColor = Colors.red;
          });
          Future.delayed(const Duration(milliseconds: 700), () {
            CustomNavigator.navigateTo(screen: () => const MyCardView());
            setState(() {
              borderColor = Colors.transparent;
            });
          });
        } else {
          setState(() {
            borderColor = Colors.transparent;
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          border: Border.all(
            color: borderColor,
            width: borderColor == Colors.red ? 3 : 0,
          ),
        ),
        child: SvgPicture.asset(widget.methodLogo),
      ),
    );
  }
}
