import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:websocket/core/constants/app_colors.dart';
import 'package:websocket/core/constants/app_images.dart';
import 'package:websocket/core/constants/app_spacing.dart';
import 'package:websocket/core/constants/app_text_style.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  PageController controller = PageController();

  int currentPage = 0;

  List banners = [
    {
      "title": "24% off shipping today on bag purchases",
      "store": "By Kutuku Store",
      "image": AppImages.shoppingImage1,
    },
    {
      "title": "30% discount on shoes",
      "store": "By Nike Store",
      "image": AppImages.shoppingImage2,
    },
    {
      "title": "New fashion bags collection",
      "store": "By Zara Store",
      "image": AppImages.shoppingImage5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 140.h,
          child: PageView.builder(
            controller: controller,
            itemCount: banners.length,

            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },

            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),

                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20.r),
                ),

                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          banners[index]["image"],
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black.withValues(alpha: 0.2),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 40.w,
                      left: 40.w,
                      top: 32.h,
                      child: Column(
                        children: [
                          Text(banners[index]["title"], style: AppTextStyle.h3),

                          
                          AppSpacing.h4,

                          Text(
                            banners[index]["store"],
                            style: AppTextStyle.body1grey.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        AppSpacing.h8,

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            banners.length,
            (index) => Container(
              margin: EdgeInsets.symmetric(horizontal: 4),

              width: 8.w,
              height: 8.h,

              decoration: BoxDecoration(
                color: currentPage == index ? AppColors.primary : Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
