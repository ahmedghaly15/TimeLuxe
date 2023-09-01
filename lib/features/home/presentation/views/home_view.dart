import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:time_luxe/constants.dart';

import '../../../../core/global/app_colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor,
        selectedIconTheme: const IconThemeData(size: 25),
        unselectedIconTheme: const IconThemeData(size: 22),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: SvgPicture.asset('assets/icons/home.svg'),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: SvgPicture.asset('assets/icons/search.svg'),
          ),
          BottomNavigationBarItem(
            label: 'Bag',
            icon: SvgPicture.asset('assets/icons/bag.svg'),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: SvgPicture.asset('assets/icons/person.svg'),
          ),
        ],
      ),
      backgroundColor: backGroundColor,
      body: body[_currentIndex],
    );
  }
}
