import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  var count = 1;

  void increase() {
    count++;
    update();
  }

  void decrease() {
    if (count > 1) count--;
    update();
  }
}
