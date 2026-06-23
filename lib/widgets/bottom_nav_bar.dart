import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:websocket/core/constants/app_icons.dart';
import 'package:websocket/core/constants/app_colors.dart';
import 'package:websocket/core/constants/app_routes.dart';

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
          icon: SvgPicture.asset(
            AppIcons.home,
            colorFilter: ColorFilter.mode(AppColors.neutral, BlendMode.srcIn),
          ),
          label: 'Home',
          activeIcon: SvgPicture.asset(
            AppIcons.home,
            colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
          ),
        ),
        BottomNavigationBarItem(
          icon:IconButton(icon:Icon(Icons.settings),onPressed: () => Get.toNamed(AppRoutes.controlPanel), color: AppColors.neutral),
          label: 'control panel',
          activeIcon: SvgPicture.asset(
            AppIcons.myorder,
            colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
          ),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppIcons.favorite,
            colorFilter: ColorFilter.mode(AppColors.neutral, BlendMode.srcIn),
          ),
          label: 'Favorite',
          activeIcon: SvgPicture.asset(
            AppIcons.favorite,
            colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
          ),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppIcons.profile,
            colorFilter: ColorFilter.mode(AppColors.neutral, BlendMode.srcIn),
          ),
          label: 'My Profile',
          activeIcon: SvgPicture.asset(
            AppIcons.profile,
            colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
          ),
        ),
      ],
    );
  }
}
