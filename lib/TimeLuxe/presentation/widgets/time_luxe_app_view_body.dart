import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_cubit.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_states.dart';
import 'package:time_luxe/core/global/helper.dart';

import '../../../core/global/app_colors.dart';

class TimeLuxeAppViewBody extends StatelessWidget {
  const TimeLuxeAppViewBody(
      {super.key, required this.cubit, required this.state});

  final TimeLuxeCubit cubit;
  final TimeLuxeStates state;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: Helper.model != null,
      builder: (context) => cubit.body[cubit.currentIndex],
      fallback: (context) => const CustomCircularProgressIndicator(
        color: AppColors.primaryColor,
        backgroundColor: Colors.white,
      ),
    );
  }
}
