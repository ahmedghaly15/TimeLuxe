import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_luxe/core/global/app_colors.dart';
import 'package:time_luxe/features/auth/sign_in/presentation/cubit/sign_in_cubit.dart';
import 'package:time_luxe/features/auth/sign_in/presentation/widgets/sign_in_view_body.dart';

import '../../../../../core/utils/service_locator.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator.get<SignInViewCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.authScaffoldBackgroundColor,
        body: GestureDetector(
          // TODO: use keyboardUnfocus method in CustomHelper
          onTap: () => FocusScope.of(context).unfocus(),
          child: const SignInViewBody(),
        ),
      ),
    );
  }
}
