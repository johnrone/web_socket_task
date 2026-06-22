import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:websocket/controllers/price_controller.dart';
import 'package:websocket/core/constants/app_colors.dart';
import 'package:websocket/core/constants/app_routes.dart';
import 'package:websocket/core/constants/app_spacing.dart';
import 'package:websocket/core/constants/app_text_style.dart';

import 'package:websocket/models/product_model.dart';
import 'package:websocket/views/favorite/favorite_controller/favorite_controller.dart';


class ProductCard extends StatelessWidget {
  final ProductModel product;

  ProductCard({super.key, required this.product});
  FavoriteController controller = Get.find<FavoriteController>();
  final PriceController priceController=Get.find();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.productDetails, arguments: product);
      },
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.r),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.network(
                        product.images.isNotEmpty
                            ? product.images[0]
                            : 'https://via.placeholder.com/150',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      right: 4.w,
                      top: 4.h,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: GetBuilder<FavoriteController>(
                          builder: (controller) {
                            bool isFav = controller.isFavorite(product);
                            return IconButton(
                              onPressed: () {
                                controller.toggleFavorite(product.id);
                              },
                              icon: Icon(
                                isFav
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: isFav ? Colors.red : AppColors.white,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              AppSpacing.h8,

              Text(
                product.title,
                maxLines: 1,
                style: AppTextStyle.h4,
                overflow: TextOverflow.ellipsis,
              ),
              AppSpacing.h4,

              Obx(()=> Text("\$${priceController.getPriceWithCurrency()}", style: AppTextStyle.h4)),
              Obx(()=> Text(priceController.getLastUpdate()))
            ],
          ),
        ),
      ),
    );
  }
}
