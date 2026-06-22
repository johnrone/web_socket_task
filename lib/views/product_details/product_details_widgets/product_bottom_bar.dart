import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websocket/core/constants/app_colors.dart';
import 'package:websocket/core/constants/app_text_style.dart';
import 'package:websocket/models/product_model.dart';
import 'package:websocket/views/cart/cart_controller/cart_controller.dart';
import 'package:websocket/widgets/custom_small_button.dart';

class ProductBottomBar extends StatelessWidget {
  final ProductModel product;
  ProductBottomBar({super.key, required this.product});
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 10, color: Colors.black.withValues(alpha: 0.05)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '\$ ',
                  style: AppTextStyle.price.copyWith(color: AppColors.primary),
                ),
                TextSpan(text: '${product.price}', style: AppTextStyle.price),
              ],
            ),
          ),

          CustomSmallButton(
            text: 'Add To Cart',
            onPressed: () {
              cartController.addToCart(product);
            },
            icon: Icons.shopping_bag_outlined,
          ),
        ],
      ),
    );
  }
}
