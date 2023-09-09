import 'package:flutter/material.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_cubit.dart';
import 'package:time_luxe/core/global/app_text_styles.dart';

class SignOutFloatingButton extends StatelessWidget {
  const SignOutFloatingButton({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final TimeLuxeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 5.0,
      ),
      child: FloatingActionButton.extended(
        extendedPadding: const EdgeInsets.symmetric(horizontal: 10),
        heroTag: "Floating Sign Out Button",
        backgroundColor: Colors.redAccent,
        onPressed: () => cubit.signOut(),
        label: Text(
          "Sign out",
          style: AppTextStyles.textStyle16.copyWith(
            color: Colors.white,
          ),
        ),
        icon: const Icon(
          Icons.logout_rounded,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }
}
