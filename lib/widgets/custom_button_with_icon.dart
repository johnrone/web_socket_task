import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:websocket/core/constants/app_spacing.dart';
import 'package:websocket/core/constants/app_text_style.dart';
import 'package:websocket/core/constants/app_colors.dart';

class CustombuttonWithIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttontext;
  final String assetsName;

  const CustombuttonWithIcon({
    super.key,

    required this.onPressed,
    required this.buttontext,
    required this.assetsName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(assetsName, width: 30.w),
            AppSpacing.w8,
            Text(buttontext, style: AppTextStyle.buttoniconfont),
          ],
        ),
      ),
    );
  }
}
