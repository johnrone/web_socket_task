

import 'package:flutter/material.dart';
import 'package:websocket/core/constants/app_spacing.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_style.dart';

class CustomSmallButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final double iconSize;
  final Color? color;

  const CustomSmallButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.iconSize=24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.primary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (icon != null) Icon(icon, color: AppColors.white,size:iconSize ,),
            AppSpacing.w8,

            Text(text, style: AppTextStyle.buttonfont),
          ],
        ),
      ),
    );
  }
}
