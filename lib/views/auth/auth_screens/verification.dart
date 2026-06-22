import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:websocket/core/constants/app_icons.dart';
import 'package:websocket/core/constants/app_colors.dart';
import 'package:websocket/core/constants/app_routes.dart';
import 'package:websocket/core/constants/app_spacing.dart';
import 'package:websocket/core/constants/app_text_style.dart';
import 'package:websocket/views/auth/auth_controller/create_account_controller.dart';
import 'package:websocket/views/auth/widgets/verification_widget/custom_buttomsheet.dart';
import 'package:websocket/views/auth/widgets/verification_widget/custom_circle_icon.dart';

import 'package:websocket/widgets/custom_button.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({super.key});
  final CreateAccountController controller = Get.find<CreateAccountController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verification', style: AppTextStyle.h3),
        centerTitle: true,
        elevation: 1,
        shadowColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            AppSpacing.h48,
            CustomCircleIcon(
              icon: AppIcons.mail,
              backgroundColor: AppColors.primary,
              iconColor: AppColors.white,
              shadowColor: AppColors.primary,
            ),
            AppSpacing.h40,
            Center(child: Text('Verification Code', style: AppTextStyle.h2)),
            AppSpacing.h12,
            Center(
              child: Text(
                'We have to sent the code verification to ',
                style: AppTextStyle.body1grey,
              ),
            ),
            AppSpacing.h12,
            Text(controller.emailController.text, style: AppTextStyle.body1),
            AppSpacing.h24,
            OtpTextField(
              focusedBorderColor: AppColors.primary,
              borderRadius: BorderRadius.circular(12.r),
              fieldWidth: 56,
              fieldHeight: 56,
              contentPadding: EdgeInsets.all(8.w),
              keyboardType: TextInputType.number,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              cursorColor: AppColors.primary,
              textStyle: AppTextStyle.h3,
              numberOfFields: 5,
              borderColor: AppColors.primary,
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {}, // end onSubmit
            ),
            AppSpacing.h24,
            Custombutton(
              onPressed: () {
                if (true) {
                  Get.bottomSheet(
                    CustomBottomSheet(
                      title: 'Register Success',
                      description:
                          'Congratulations! your account already created.\n please login to get amazing experience.',
                      buttonText: 'Go To Homepage',
                      onPressed: () {
                        Get.offNamed(AppRoutes.login);
                      },
                    ),
                  );
                }
              },
              buttontext: 'Submit',
            ),
            AppSpacing.h24,
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Didn\'t reveice the code?',
                      style: AppTextStyle.body1grey,
                    ),
                    TextSpan(text: ' Resend', style: AppTextStyle.bodyprimary),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
