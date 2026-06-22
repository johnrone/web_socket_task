import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:websocket/core/constants/app_colors.dart';
import 'package:websocket/core/constants/app_icons.dart';
import 'package:websocket/core/constants/app_text_style.dart';
import 'package:websocket/views/home/widgets/product_grid.dart';
import 'package:websocket/views/search/search_controller/search_controller.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  // final controller = Get.find<ProductController>();
  final SearchControllerrr searchControllerrr = Get.put(SearchControllerrr());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: "Search products...",
            hintStyle: AppTextStyle.body1grey,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(AppIcons.search, width: 24, height: 24),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(width: 1, color: AppColors.primary),
            ),
          ),
          onChanged: searchControllerrr.search,
        ),
      ),
      body: Obx(
        () => ProductGrid(products: searchControllerrr.filteredProducts.value),
      ),
    );
  }
}
