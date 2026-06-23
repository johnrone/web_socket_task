import 'package:get/get.dart';
import 'package:websocket/models/product_model.dart';
import 'package:websocket/views/home/home_controller/home_controller.dart';


class SearchControllerrr extends GetxController {
  final HomeController productController = Get.find();
  var isLoading = true.obs;

 RxList<ProductModel> filteredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    filteredProducts.value = productController.products;
    super.onInit();
  }

  void search(String value) {
    filteredProducts.value = productController.products
        .where((p) =>
            p.title.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }


  
}  
