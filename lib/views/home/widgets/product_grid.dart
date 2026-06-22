import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:websocket/core/constants/app_text_style.dart';
import 'package:websocket/models/product_model.dart';
import 'package:websocket/widgets/product_card.dart';

import '../home_controller/home_controller.dart';

class ProductGrid extends StatelessWidget {
  final List<ProductModel> products;
  HomeController controller = Get.put(HomeController());
    ProductGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return Center(child: Text("No products found ❌",style: AppTextStyle.h3));
    }

    return Obx(()=>
      RefreshIndicator(onRefresh:controller.getProducts ,
        child: GridView.builder(
          itemCount: products.length,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: ScreenUtil().screenWidth > 600 ? 3 : 2,
            mainAxisSpacing: 12.h,
            crossAxisSpacing: 12.w,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCard(product: product);
          },
        ),
      ),
    );
  }
}