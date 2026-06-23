import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:websocket/core/constants/app_text_style.dart';

class PaymentItem extends StatelessWidget {
  final dynamic item;

  const PaymentItem.paymentItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Image.network(item.product.images[0], width: 50.w),
      ),
      title: Text(item.product.title, style: AppTextStyle.h4),
      subtitle: Text("Color: black"),
      trailing: Text("\$${item.product.price}", style: AppTextStyle.h4),
    );
  }
}
