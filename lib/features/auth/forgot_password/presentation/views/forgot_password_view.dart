import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_luxe/core/global/app_colors.dart';
import 'package:time_luxe/core/utils/service_locator.dart';
import 'package:time_luxe/features/auth/forgot_password/presentation/cubit/forgot_password_view_cubit.dart';

import '../widgets/forgot_password_view_body.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator.get<ForgotPasswordViewCubit>(),
      child: const Scaffold(
        backgroundColor: AppColors.authScaffoldBackgroundColor,
        body: ForgotPasswordViewBody(),
      ),
    );
  }
}
