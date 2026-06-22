import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCircleIcon extends StatelessWidget {
  final String icon;
  final Color backgroundColor;
  final Color iconColor;
  final Color shadowColor;

  const CustomCircleIcon({
    super.key,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    required this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(blurStyle: BlurStyle.solid,
            color: shadowColor.withValues(alpha: 0.2),
            blurRadius: 20,
            spreadRadius: 16,
          ),
        ],
      ),
      child: CircleAvatar(
        maxRadius: 48,
        backgroundColor: backgroundColor,
        child: Transform.scale(
          scale: 1.2,
          child: SvgPicture.asset(
            icon,
            color: iconColor,
            height: 32.h,
            width: 32.w,
          ),
        ),
      ),
    );
  }
}
