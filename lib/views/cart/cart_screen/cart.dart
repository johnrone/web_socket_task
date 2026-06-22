import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:websocket/core/constants/app_colors.dart';
import 'package:websocket/core/constants/app_routes.dart';
import 'package:websocket/core/constants/app_spacing.dart';
import 'package:websocket/core/constants/app_text_style.dart';
import 'package:websocket/views/cart/cart_controller/cart_controller.dart';
import 'package:websocket/widgets/custom_button.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
        centerTitle: true,
        titleTextStyle: AppTextStyle.h3,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag_outlined)),
        ],
      ),

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: GetBuilder<CartController>(
          builder: (controller) => controller.cartItems.isEmpty
              ? Center(child: Text("Cart is empty", style: AppTextStyle.h3))
              : ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (context, index) {
                    final item = controller.cartItems[index];
                    final product = item.product;
                    final quantity = item.quantity;

                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 16.w),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: AppColors.neutral),
                        ),
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                            value: controller.isSelected(product),
                            onChanged: (_) {
                              controller.toggleSelection(product);
                            },
                            side: BorderSide(
                              color: AppColors.neutral,
                              width: 1.5,
                            ),
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(8.r),
                            ),
                          ),
                          AppSpacing.w12,

                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Image.network(
                              product.images[0],
                              width: 80,
                              height: 96,
                              fit: BoxFit.cover,
                            ),
                          ),

                          AppSpacing.w12,

                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyle.h3,
                                ),

                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Color:',
                                        style: AppTextStyle.body1grey,
                                      ),
                                      TextSpan(
                                        text: ' Black',
                                        style: AppTextStyle.body1,
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 4,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.field,
                                        borderRadius: BorderRadius.circular(
                                          20.r,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: AppColors.white,
                                            maxRadius: 16,
                                            child: IconButton(
                                              onPressed: () => cartController
                                                  .decreaseQty(product),
                                              icon: Icon(Icons.remove),
                                              iconSize: 16,
                                            ),
                                          ),
                                          AppSpacing.w8,
                                          Text(
                                            "$quantity",
                                            style: AppTextStyle.h4,
                                          ),
                                          AppSpacing.w8,

                                          CircleAvatar(
                                            backgroundColor: AppColors.white,
                                            maxRadius: 16,
                                            child: IconButton(
                                              onPressed: () => cartController
                                                  .increaseQty(product),
                                              icon: Icon(Icons.add),
                                              iconSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Text(
                                      "\$${product.price}",
                                      style: AppTextStyle.h1,
                                    ),
                                  ],
                                ),
                                //
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (controller) {
          if (!controller.hasSelectedItems()) {
            return SizedBox();
          }

          return Container(
            height: 160,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Custombutton(
                  onPressed: () {
                    controller.deleteSelectedItems();
                  },
                  buttontext: 'delete selected',
                ),
                AppSpacing.h16,

                // 🟢 Next
                Custombutton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.address);
                  },
                  buttontext: 'Next',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
