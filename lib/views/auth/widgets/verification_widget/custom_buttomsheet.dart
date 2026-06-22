import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:websocket/core/constants/app_colors.dart';
import 'package:websocket/core/constants/app_icons.dart';
import 'package:websocket/core/constants/app_spacing.dart';
import 'package:websocket/core/constants/app_text_style.dart';
import 'package:websocket/views/auth/widgets/verification_widget/custom_circle_icon.dart';
import 'package:websocket/widgets/custom_button.dart';

class CustomBottomSheet extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onPressed;

  const CustomBottomSheet({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppSpacing.h8,
          Container(
            width: 40.w,
            height: 6,
            decoration: BoxDecoration(
              color: AppColors.neutral,
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),

          AppSpacing.h48,

          CustomCircleIcon(
            icon: AppIcons.success,
            backgroundColor: AppColors.mygreen,
            iconColor: AppColors.white,
            shadowColor: AppColors.mygreen,
          ),

          AppSpacing.h48,

          Text(title, style: AppTextStyle.h2),

          AppSpacing.h4,

          Text(
            description,
            textAlign: TextAlign.center,
            style: AppTextStyle.body1grey,
          ),

          AppSpacing.h40,

          Custombutton(onPressed: onPressed, buttontext: buttonText),

          AppSpacing.h24,
        ],
      ),
    );
  }
}
