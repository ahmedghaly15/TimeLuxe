import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/core/global/app_colors.dart';
import 'package:time_luxe/core/utils/service_locator.dart';
import 'package:time_luxe/features/auth/sign_up/presentation/cubit/sign_up_view_cubit.dart';

import '../widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator.get<SignUpViewCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.authScaffoldBackgroundColor,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: AppColors.gradientColors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: GestureDetector(
            onTap: () => CustomHelper.keyboardUnfocus(context),
            child: const SignUpViewBody(),
          ),
        ),
      ),
    );
  }
}
