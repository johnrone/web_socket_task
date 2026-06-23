import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:websocket/core/constants/app_icons.dart';
import 'package:websocket/core/constants/app_routes.dart';
import 'package:websocket/core/constants/app_spacing.dart';
import 'package:websocket/core/constants/app_text_style.dart';

class HomeHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onSearchPressed;
  const HomeHeader({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onSearchPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: CircleAvatar(radius: 25.r),
        title: Text(title, style: AppTextStyle.h4),
        subtitle: Text(subtitle, style: AppTextStyle.body1grey),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                onSearchPressed();
              },

              icon: SvgPicture.asset(AppIcons.search),
            ),
            AppSpacing.h8,
            IconButton(
              onPressed: () {Get.toNamed(AppRoutes.notifications);},
              icon: Badge(label: Text('5'),child: SvgPicture.asset(AppIcons.notification)),
            ),
          ],
        ),
      ),
    );
  }
}
