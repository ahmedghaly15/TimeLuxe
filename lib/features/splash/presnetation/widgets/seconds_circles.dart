import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SecondsCircles extends StatelessWidget {
  const SecondsCircles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: SvgPicture.asset('assets/icons/tabler_time-duration-10.svg'),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: SvgPicture.asset('assets/icons/tabler_time-duration-15.svg'),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: SvgPicture.asset('assets/icons/tabler_time-duration-30.svg'),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: SvgPicture.asset('assets/icons/tabler_time-duration-45.svg'),
        ),
        SvgPicture.asset('assets/icons/tabler_time-duration-60.svg'),
      ],
    );
  }
}
