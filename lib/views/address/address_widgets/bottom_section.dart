import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:websocket/core/constants/app_routes.dart';
import 'package:websocket/core/constants/app_spacing.dart';

import 'package:websocket/widgets/custom_button.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppSpacing.h24,
          Custombutton(
            onPressed: () {
              Get.toNamed(AppRoutes.payment);
            },
            buttontext: 'Confirm',
          ),
          AppSpacing.h16,
        ],
      ),
    );
  }
}
