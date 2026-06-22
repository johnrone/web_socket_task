import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:websocket/core/constants/app_colors.dart';
import 'package:websocket/core/constants/app_images.dart';
import 'package:websocket/core/constants/app_spacing.dart';
import 'package:websocket/core/constants/app_text_style.dart';
import 'package:websocket/widgets/custom_button.dart';
import 'package:get/get.dart';
import 'package:websocket/views/payment/payment_controller/payment_controller.dart';

class BottomSection extends StatelessWidget {
  final PaymentController paymentController =
    Get.find();
  final double total;

   BottomSection({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text("Payment Method", style: AppTextStyle.h3),
          ),

          AppSpacing.h16,

          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.neutral),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: Image.asset(AppImages.masterCardLogo),
              ),
              title: Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text('Master Card'),
              ),
              subtitle: Text('**** **** 1234'),
              titleTextStyle: AppTextStyle.body1,
              subtitleTextStyle: AppTextStyle.body1grey,
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.neutral,
              ),
            ),
          ),
          AppSpacing.h24,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total amount", style: AppTextStyle.body1grey),
              Text("\$${total.toStringAsFixed(2)}", style: AppTextStyle.h4),
            ],
          ),
          AppSpacing.h24,
          Custombutton(onPressed: ()  async {

  await paymentController.makePayment();

}, buttontext: 'Checkout Now'),
         AppSpacing.h16,
        ],
      ),
    );
  }
}
