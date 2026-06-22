
import 'package:get/get.dart';
import 'package:websocket/models/product_model.dart';
import '../../../core/constants/api_links.dart';
import '../../../core/classes/crud.dart';

class HomeController extends GetxController {
  final Crud crud = Crud();
  var products = <ProductModel>[].obs;
  var isLoading = true.obs;

  Future<void> getProducts() async {
    try {
      isLoading.value = true;
      final data = await crud.get(ApiLinks.products);

      products.value = data
          .map<ProductModel>((e) => ProductModel.fromJson(e))
          .toList();
      // return data;
    } catch (e) {
      print("error $e");
      Get.snackbar('Error', 'Failed to load products');
    } finally {
      isLoading.value = false;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(milliseconds: 500), () {
      getProducts();
    
    });
  }
}
