import 'package:flutter/material.dart';
import 'package:websocket/core/constants/app_text_style.dart';
import 'package:websocket/core/constants/app_colors.dart';

class Custombutton extends StatelessWidget {
  // final String text;
  final VoidCallback onPressed;
  final String buttontext;
  final bool isLoading;

  const Custombutton({
    super.key,
    required this.onPressed,
    required this.buttontext,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(buttontext, style: AppTextStyle.buttonfont),
      ),
    );
  }
}
