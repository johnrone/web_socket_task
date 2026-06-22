import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:websocket/core/constants/app_colors.dart';
import 'package:websocket/core/constants/app_spacing.dart';
import 'package:websocket/core/constants/app_text_style.dart';
import 'package:websocket/views/product_details/product_details_controller/product_details_controller.dart';

class ProductQuantity extends StatelessWidget {
  ProductQuantity({super.key});
  final controller = Get.find<ProductDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.field,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.white,
            maxRadius: 16,
            child: IconButton(
              onPressed: controller.decrease,
              icon: Icon(Icons.remove),
              iconSize: 16,
            ),
          ),

          AppSpacing.w8,

          GetBuilder<ProductDetailsController>(
            builder: (controller) =>
                Text("${controller.count}", style: AppTextStyle.h4),
          ),

          AppSpacing.w8,

          CircleAvatar(
            backgroundColor: AppColors.white,
            maxRadius: 16,
            child: IconButton(
              onPressed: controller.increase,
              icon: Icon(Icons.add),
              iconSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
