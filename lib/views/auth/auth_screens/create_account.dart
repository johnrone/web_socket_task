import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:websocket/core/constants/app_icons.dart';
import 'package:websocket/core/constants/app_routes.dart';
import 'package:websocket/core/constants/app_spacing.dart';
import 'package:websocket/core/constants/app_text_style.dart';
import 'package:websocket/core/constants/app_colors.dart';
import 'package:websocket/core/utils/validators.dart';
import 'package:websocket/views/auth/auth_controller/create_account_controller.dart';
import 'package:websocket/views/auth/auth_screens/login_screen.dart';
import 'package:websocket/widgets/custom_button.dart';
import 'package:websocket/widgets/custom_button_with_icon.dart';
import 'package:websocket/widgets/custom_text_field.dart';
import 'dart:io' as io;

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({super.key});

  final CreateAccountController createAccountController = Get.find<CreateAccountController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: createAccountController.formKey,
        child: Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSpacing.h24,
                  Text('Create Account', style: AppTextStyle.h3),

                  AppSpacing.h4,
                  Text(
                    'Start shopping with create your account ',
                    style: AppTextStyle.body1grey,
                  ),
                  AppSpacing.h24,
                  Text('Username', style: AppTextStyle.h4),
                  AppSpacing.h8,
                  CustomTextFormField(
                    hinttext: 'Create your username',
                    obscuretext: false,
                    svgPicPath: AppIcons.profile,
                    controller: createAccountController.userNameController,
                    validator: (val) {
                      return AppValidators.validateUserName(val);
                    },
                  ),
                  AppSpacing.h16,
                  Text('Commercial Name', style: AppTextStyle.h4),

                  AppSpacing.h8,

                  CustomTextFormField(
                    hinttext: 'Enter commercial name',
                    obscuretext: false,
                    svgPicPath: AppIcons.profile,

                    controller:
                        createAccountController.commercialNameController,
                  ),
                  AppSpacing.h16,

                  Text('Commercial Account', style: AppTextStyle.h4),

                  AppSpacing.h8,

                  CustomTextFormField(
                    hinttext: 'Enter commercial account',
                    obscuretext: false,
                    svgPicPath: AppIcons.profile,

                    controller:
                        createAccountController.commercialAccountController,
                  ),
                  AppSpacing.h16,

                  Text('Email or Phone Number', style: AppTextStyle.h4),
                  AppSpacing.h8,
                  CustomTextFormField(
                    hinttext: 'Enter your email or phone number',
                    obscuretext: false,
                    svgPicPath: AppIcons.mail,
                    controller: createAccountController.emailController,
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
                    controller: createAccountController.passwordController,
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
                        style: AppTextStyle.body1.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  AppSpacing.h16,

                  Text('Store License', style: AppTextStyle.h4),

                  AppSpacing.h8,

                  ElevatedButton(
                    onPressed: () {
                      Get.bottomSheet(
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                          padding: const EdgeInsets.all(20),

                          child: Column(
                            mainAxisSize: MainAxisSize.min,

                            children: [
                              ListTile(
                                leading: const Icon(Icons.photo),

                                title: const Text("Gallery"),

                                onTap: () {
                                  Get.back();

                                  createAccountController.pickStoreLicense(
                                    ImageSource.gallery,
                                  );
                                },
                              ),

                              ListTile(
                                leading: const Icon(Icons.camera_alt),

                                title: const Text("Camera"),

                                onTap: () {
                                  Get.back();

                                  createAccountController.pickStoreLicense(
                                    ImageSource.camera,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },

                    child: const Text("Choose Image"),
                  ),
                  AppSpacing.h8,

                  Obx(() {
                    if (createAccountController
                        .storeLicensePath
                        .value
                        .isEmpty) {
                      return Text("No Image Selected");
                    }

                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: kIsWeb
                          ? Image.network(
                              createAccountController.storeLicensePath.value,
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              io.File(createAccountController.storeLicensePath.value),
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                    );
                  }),
                  Obx(() => Custombutton(
                    onPressed: () {
                      createAccountController.createAccountByFirebase();
                    },
                    buttontext: "Create Account",
                    isLoading: createAccountController.isLoading.value,
                  )),
                  AppSpacing.h16,
                  InkWell(onTap: ()=> Get.to(()=>LoginScreen()),child: Text('login'),),
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
                  AppSpacing.h40,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
