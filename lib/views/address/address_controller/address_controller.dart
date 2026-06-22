import 'package:get/get.dart';

class AddressController extends GetxController {
  int selectedIndex = -1;

  void select(int index) {
    selectedIndex = index;
    update();
  }

  bool isSelected(int index) {
    return selectedIndex == index;
  }
}