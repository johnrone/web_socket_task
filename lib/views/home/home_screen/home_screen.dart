import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:websocket/core/constants/app_colors.dart';
import 'package:websocket/core/constants/app_routes.dart';
import 'package:websocket/core/constants/app_spacing.dart';
import 'package:websocket/core/constants/app_text_style.dart';
import 'package:websocket/views/home/home_controller/home_controller.dart';
import 'package:websocket/views/home/widgets/product_grid.dart';
import 'package:websocket/widgets/bottom_nav_bar.dart';
import 'package:websocket/views/home/widgets/home_banner.dart';
import 'package:websocket/views/home/widgets/home_header.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            AppSpacing.h40,
            HomeHeader(
              title: 'Hi john',
              subtitle: 'let\'s go shopping',
              onSearchPressed: () {
                Get.toNamed(AppRoutes.search);
              },
            ),
            TabBar(
              unselectedLabelColor: AppColors.neutral,
              unselectedLabelStyle: AppTextStyle.h4.copyWith(
                color: AppColors.neutral,
              ),
              labelStyle: AppTextStyle.h4,
              tabs: [
                Tab(child: Text('Home')),
                Tab(child: Text('Category')),
              ],
            ),
            AppSpacing.h24,

            HomeBanner(),

            AppSpacing.h16,
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("New Arrifals 🔥", style: AppTextStyle.h3),
                  Text("See All", style: AppTextStyle.bodyprimary),
                ],
              ),
            ),
            AppSpacing.h8,
            Expanded(
              child: Obx(
                () => controller.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : TabBarView(
                        children: [
                          ProductGrid(products: controller.products),

                          Center(child: Text('Category tab')),
                        ],
                      ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
