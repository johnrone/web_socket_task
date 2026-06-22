import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:websocket/core/constants/app_icons.dart';
import 'package:websocket/core/constants/app_colors.dart';
import 'package:websocket/core/constants/app_routes.dart';
import 'package:websocket/views/control_panel/control_panel_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (value) {
        setState(() {
          selectedIndex = value;
        });
      },
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.neutral,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppIcons.home, color: AppColors.neutral),
          label: 'Home',
          activeIcon: SvgPicture.asset(
            AppIcons.home,
            color: AppColors.primary,
          ),
        ),
        BottomNavigationBarItem(
          icon:IconButton(icon:Icon(Icons.settings),onPressed: () => Get.toNamed(AppRoutes.controlPanel), color: AppColors.neutral),
          label: 'control panel',
          activeIcon: SvgPicture.asset(
            AppIcons.myorder,
            color: AppColors.primary,
          ),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppIcons.favorite, color: AppColors.neutral),
          label: 'Favorite',
          activeIcon: SvgPicture.asset(
            AppIcons.favorite,
            color: AppColors.primary,
          ),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppIcons.profile, color: AppColors.neutral),
          label: 'My Profile',
          activeIcon: SvgPicture.asset(
            AppIcons.profile,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
