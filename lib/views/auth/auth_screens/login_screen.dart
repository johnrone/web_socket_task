import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:websocket/core/constants/app_icons.dart';
import 'package:websocket/core/constants/app_spacing.dart';
import 'package:websocket/core/constants/app_text_style.dart';

import 'package:websocket/core/utils/validators.dart';
import 'package:websocket/widgets/custom_button.dart';
import 'package:websocket/widgets/custom_button_with_icon.dart';
import 'package:websocket/widgets/custom_text_field.dart';
import '../auth_controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: loginController.formKey,
        child: Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSpacing.h24,
                  Text('Login Account', style: AppTextStyle.h3),

                  AppSpacing.h4,
                  Text(
                    'Please login with registered account',
                    style: AppTextStyle.body1grey,
                  ),
                  AppSpacing.h24,
                  Text('Email or Phone Number', style: AppTextStyle.h4),
                  AppSpacing.h8,
                  CustomTextFormField(
                    hinttext: 'Enter your email or phone number',
                    obscuretext: false,
                    svgPicPath: AppIcons.mail,
                    controller: loginController.emailController,
                    validator: (val) {
                      return AppValidators.validateEmail(val);
                    },
                  ),

                  AppSpacing.h16,
                  Text('Password', style: AppTextStyle.h4),
                  AppSpacing.h8,
                  CustomTextFormField(
                    hinttext: 'Create your password',
                    obscuretext: true,
                    svgPicPath: AppIcons.password,
                    controller: loginController.passwordController,
                    validator: (value) {
                      return AppValidators.validatePassword(value);
                    },
                  ),
                  AppSpacing.h8,
                  Container(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      child: Text(
                        'Forget Password ?',
                        style: AppTextStyle.bodyprimary,
                      ),
                    ),
                  ),
                 AppSpacing.h24,
                  Obx(() => Custombutton(
                    onPressed: () {
                      loginController.loginWithValid();
                    },
                    buttontext: "Sign In",
                    isLoading: loginController.isLoading.value,
                  )),
                  AppSpacing.h16,
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Or using other method',
                      style: AppTextStyle.body1grey,
                    ),
                  ),
                  AppSpacing.h16,
                  CustombuttonWithIcon(
                    onPressed: () {},
                    buttontext: 'Sign in with Google',
                    assetsName: AppIcons.google,
                  ),
                  
                  AppSpacing.h16,
                  CustombuttonWithIcon(
                    onPressed: () {},
                    buttontext: 'Sign in with Facebook',
                    assetsName: AppIcons.facebook,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
