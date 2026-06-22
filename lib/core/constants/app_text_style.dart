import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:websocket/core/constants/app_colors.dart';

class AppTextStyle {
  static TextStyle h1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.primarytext,
  );

  static TextStyle h2 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primarytext,
  );

  static TextStyle h3 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.primarytext,
  );

  static TextStyle h4 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primarytext,
  );

  static TextStyle body1 = TextStyle(
    fontSize: 14.sp,
    color: AppColors.primarytext,
  );

  static TextStyle bodyprimary = TextStyle(
    fontSize: 14.sp,
    color: AppColors.primary,
    fontWeight: FontWeight.bold,
  );

  static TextStyle body1grey = TextStyle(
    fontSize: 14.sp,
    color: AppColors.neutral,
  );

  static TextStyle buttonfont = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static TextStyle buttoniconfont = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.primarytext,
  );
  static TextStyle price = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.primarytext,
  );
}
