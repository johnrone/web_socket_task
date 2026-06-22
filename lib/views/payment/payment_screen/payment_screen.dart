import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websocket/core/constants/app_spacing.dart';
import 'package:websocket/core/constants/app_text_style.dart';
import 'package:websocket/views/payment/payment_controller/payment_controller.dart';
import 'package:websocket/views/payment/payment_widgets/location_widget.dart';
import 'package:websocket/views/payment/payment_widgets/bottom_section.dart';

import 'package:websocket/views/payment/payment_widgets/product_section.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PaymentController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
        centerTitle: true,
        titleTextStyle: AppTextStyle.h3,
      ),
      body: GetBuilder<PaymentController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Address", style: AppTextStyle.h3),
                    Text("Edit", style: AppTextStyle.bodyprimary),
                  ],
                ),
                LocationWidget(),

                AppSpacing.h24,

                ProductsSection(),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: GetBuilder<PaymentController>(
        builder: (controller) {
          return BottomSection(total: controller.calculateTotalPrice());
        },
      ),
    );
  }
}
