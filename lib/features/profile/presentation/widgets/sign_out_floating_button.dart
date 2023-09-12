import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_cubit.dart';

class SignOutFloatingButton extends StatelessWidget {
  const SignOutFloatingButton({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final TimeLuxeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0.h,
        horizontal: 5.0.w,
      ),
      child: FloatingActionButton(
        heroTag: "Floating Sign Out Button",
        backgroundColor: Colors.redAccent,
        onPressed: () => cubit.signOut(),
        child: Icon(
          Icons.logout_rounded,
          color: Colors.white,
          size: 22.w,
        ),
      ),
    );
  }
}
