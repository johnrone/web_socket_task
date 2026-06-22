import 'package:flutter/material.dart';
import 'package:websocket/core/constants/app_images.dart';
import 'package:websocket/core/constants/app_text_style.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(8),
        child: Image.asset(AppImages.locationMap,fit: BoxFit.cover,),
      ),
      title: Text("House", style: AppTextStyle.h4),
      subtitle: Text(
        "5482 Adobe Falls Rd #15San Diego, California(CA), 92120",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyle.body1grey,
      ),
    );
  }
}
