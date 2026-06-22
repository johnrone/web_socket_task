import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:websocket/core/constants/app_text_style.dart';
import 'package:websocket/core/constants/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String hinttext;
  final bool obscuretext;
  final String svgPicPath;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.hinttext,
    required this.obscuretext,
    required this.svgPicPath,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscuretext,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: AppTextStyle.body1grey,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(svgPicPath, width: 24, height: 24),
        ),
        filled: true,
        fillColor: AppColors.field,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.field),
          borderRadius: BorderRadius.circular(14.r),
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: AppColors.field),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 2),
          borderRadius: BorderRadius.circular(14.r),
        ),
      ),
    );
  }
}
