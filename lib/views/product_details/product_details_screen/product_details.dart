import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:websocket/core/constants/app_colors.dart';
import 'package:websocket/core/constants/app_routes.dart';
import 'package:websocket/core/constants/app_spacing.dart';
import 'package:websocket/core/constants/app_text_style.dart';
import 'package:websocket/models/product_model.dart';
import 'package:websocket/views/cart/cart_controller/cart_controller.dart';
import 'package:websocket/views/product_details/product_details_controller/product_details_controller.dart';
import 'package:websocket/views/product_details/product_details_widgets/product_bottom_bar.dart';
import 'package:websocket/views/product_details/product_details_widgets/product_info.dart';
import 'package:websocket/views/product_details/product_details_widgets/product_quantity.dart';
// import 'package:websocket/widgets/custom_button.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key});
  ProductModel product = Get.arguments;
  final CartController cartController = Get.find();
  ProductDetailsController productDetailsController =
      Get.find<ProductDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Product', style: AppTextStyle.h3),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.cart);
            },
            icon: Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),

      body: Column(
        children: [
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Image.network(
              product.images.isNotEmpty ? product.images[0] : '',
              fit: BoxFit.contain,
            ),
          ),

          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 16.h, right: 16.w, left: 16.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: ProductInfo(product: product)),

                        Container(
                          child: Column(
                            children: [
                              ProductQuantity(),
                              AppSpacing.h8,
                              Text(
                                'Avaliable in stok',
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyle.body1.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppSpacing.h16,
                        Text('Color', style: AppTextStyle.h3),
                        AppSpacing.h8,
                        Row(
                          children: [
                            CircleAvatar(backgroundColor: Colors.yellow),
                            SizedBox(width: 16),
                            CircleAvatar(backgroundColor: Colors.green),
                          ],
                        ),
                      ],
                    ),
                    AppSpacing.h16,

                    Text('Description', style: AppTextStyle.h3),
                    AppSpacing.h8,

                    Text(product.description, style: AppTextStyle.body1grey),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ProductBottomBar(product: product),
    );
  }
}
