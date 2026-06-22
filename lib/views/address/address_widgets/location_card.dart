import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:websocket/core/constants/app_colors.dart';
import 'package:websocket/core/constants/app_images.dart';
import 'package:websocket/core/constants/app_text_style.dart';
import 'package:websocket/views/address/address_controller/address_controller.dart';

class LocationCard extends StatelessWidget {
  String textTitle;
  String textSubTitle;
  final int index;
  LocationCard({
    super.key,
    required this.textTitle,
    required this.textSubTitle,
    required this.index,
  });
  final controller = Get.find<AddressController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.select(index);
      },
      child: GetBuilder<AddressController>(
        builder: (controller) {
          final isSelected = controller.isSelected(index);
          return Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.neutral,
                width: isSelected ? 3 : 1,
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: ListTile(
              title: Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(textTitle),
              ),
              subtitle: Text(textSubTitle),
              titleTextStyle: AppTextStyle.body1,
              subtitleTextStyle: AppTextStyle.body1grey,
              trailing: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  border: BoxBorder.all(color: AppColors.neutral),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(AppImages.locationMap),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
