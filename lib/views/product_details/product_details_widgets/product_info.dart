import 'package:flutter/material.dart';
import 'package:websocket/core/constants/app_spacing.dart';
import 'package:websocket/core/constants/app_text_style.dart';
import 'package:websocket/models/product_model.dart';

class ProductInfo extends StatelessWidget {
  final ProductModel product;

  const ProductInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: AppTextStyle.h3,
          overflow: TextOverflow.ellipsis,
        ),
        AppSpacing.h8,
        Row(
          children: [
            Icon(Icons.star, color: Colors.amber),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '4.8', style: AppTextStyle.h4),
                  TextSpan(text: '(23 Reviews)', style: AppTextStyle.body1grey),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
