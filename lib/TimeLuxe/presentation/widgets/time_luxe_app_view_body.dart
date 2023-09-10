import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_cubit.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_states.dart';
import 'package:time_luxe/core/utils/helper.dart';

import '../../../core/widgets/my_circular_progress_indicator.dart';

class TimeLuxeAppViewBody extends StatelessWidget {
  const TimeLuxeAppViewBody({
    super.key,
    required this.cubit,
    required this.state,
  });

  final TimeLuxeCubit cubit;
  final TimeLuxeStates state;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (cubit.currentIndex != 0) {
          cubit.changeBottomNavToHome();
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: ConditionalBuilder(
        condition: Helper.model != null,
        builder: (context) => cubit.body[cubit.currentIndex],
        fallback: (context) => const MyCircularProgressIndicator(),
      ),
    );
  }
}
