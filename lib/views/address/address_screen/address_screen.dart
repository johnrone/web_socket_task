import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:websocket/core/constants/app_colors.dart';
import 'package:websocket/core/constants/app_icons.dart';
import 'package:websocket/core/constants/app_spacing.dart';
import 'package:websocket/core/constants/app_text_style.dart';
import 'package:websocket/views/address/address_controller/address_controller.dart';
import 'package:websocket/views/address/address_widgets/bottom_section.dart';
import 'package:websocket/views/address/address_widgets/location_card.dart';

class AddressScreen extends StatelessWidget {
   AddressScreen({super.key});
  final controller = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address"),
        centerTitle: true,
        titleTextStyle: AppTextStyle.h3,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpacing.h12,
            Text("Choose your location", style: AppTextStyle.h3),
            AppSpacing.h8,
            Text(
              'let\'s find your unforgettable event.Choose a location below to get started.',
              style: AppTextStyle.body1grey,
            ),
            AppSpacing.h32,
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.neutral, width: 2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: SvgPicture.asset(
                  AppIcons.locationtwo,
                  width: 32,
                  height: 32,
                ),
                title: Text('San Diego, CA'),
                titleTextStyle: AppTextStyle.h3,
                trailing: SvgPicture.asset(
                  AppIcons.locationone,
                  width: 32,
                  height: 32,
                  color: AppColors.neutral,
                ),
              ),
            ),
            GetBuilder<AddressController>(
              builder: (controller) => Column(
                children: [
                  AppSpacing.h24,
                  Text("Select location", style: AppTextStyle.h3),
                  AppSpacing.h24,
                  LocationCard(index: 0,
                    textTitle: 'Los Angeles',
                    textSubTitle: 'Los Angeles, United States',
                  ),
                  AppSpacing.h16,
                  LocationCard(index: 1,
                    textTitle: 'San Francisco',
                    textSubTitle: 'San Francisco, United States',
                  ),
                  AppSpacing.h16,
                  LocationCard(index: 2,
                    textTitle: 'New York',
                    textSubTitle: 'New York, United States',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomSection(),
    );
  }
}



