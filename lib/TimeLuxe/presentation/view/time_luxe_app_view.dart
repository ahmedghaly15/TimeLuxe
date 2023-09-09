import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_cubit.dart';
import 'package:time_luxe/TimeLuxe/presentation/view/manager/time_luxe_states.dart';
import 'package:time_luxe/TimeLuxe/presentation/widgets/time_luxe_app_view_body.dart';

import '../../../core/global/app_colors.dart';
import '../widgets/bottom_nav_bar.dart';

class TimeLuxeAppView extends StatelessWidget {
  const TimeLuxeAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeLuxeCubit, TimeLuxeStates>(
        builder: (context, state) {
      TimeLuxeCubit cubit = TimeLuxeCubit.getObject(context);

      return Scaffold(
        bottomNavigationBar: BottomNavBar(cubit: cubit),
        backgroundColor: AppColors.backGroundColor,
        body: TimeLuxeAppViewBody(cubit: cubit, state: state),
      );
    });
  }
}
