import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:websocket/core/constants/app_spacing.dart';
import 'package:websocket/core/constants/app_text_style.dart';

import 'package:websocket/views/payment/payment_controller/payment_controller.dart';
import 'package:websocket/views/payment/payment_widgets/product_item.dart';

class ProductsSection extends StatelessWidget {
  final controller = Get.find<PaymentController>();

  ProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = controller.getSelectedItems();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Text("Products (${items.length})",style: AppTextStyle.h3,),
        ),

        AppSpacing.h12,

        ...items.map((item) => PaymentItem.PaymentItem(item: item)),
      ],
    );
  }
}
