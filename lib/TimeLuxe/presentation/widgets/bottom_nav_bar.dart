import 'package:flutter/material.dart';

import '../../../core/global/app_colors.dart';
import '../../../core/global/app_text_styles.dart';
import '../view/manager/time_luxe_cubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.cubit,
  });

  final TimeLuxeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: cubit.currentIndex,
      onTap: (index) => cubit.changeBottomNavIndex(index),
      items: cubit.bottomNavItems,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryColor,
      selectedIconTheme: const IconThemeData(size: 29),
      unselectedIconTheme: const IconThemeData(size: 24),
      selectedLabelStyle: AppTextStyles.textStyle18
          .copyWith(fontWeight: FontWeight.w600, color: AppColors.primaryColor),
      unselectedLabelStyle: AppTextStyles.textStyle18.copyWith(
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }
}
