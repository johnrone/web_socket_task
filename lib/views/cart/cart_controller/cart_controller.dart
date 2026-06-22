import 'package:get/get.dart';
import 'package:websocket/models/product_model.dart';
import 'package:websocket/models/cart_item_model.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[];
  Set<int> selectedItems = {};
  void toggleSelection(ProductModel product) {
    if (selectedItems.contains(product.id)) {
      selectedItems.remove(product.id);
    } else {
      selectedItems.add(product.id);
    }
    update();
  }

  bool isSelected(ProductModel product) {
    return selectedItems.contains(product.id);
  }

  bool hasSelectedItems() {
    return selectedItems.isNotEmpty;
  }

  void deleteSelectedItems() {
    cartItems.removeWhere((item) => selectedItems.contains(item.product.id));

    selectedItems.clear();
    update();
  }

  void addToCart(ProductModel product, {int quantity = 1}) {
    int index = cartItems.indexWhere(
      (element) => element.product.id == product.id,
    );
    if (index != -1) {
      cartItems[index].quantity += quantity;
    } else {
      cartItems.add(CartItem(product: product, quantity: quantity));
    }
    update();
  }

  void increaseQty(ProductModel product) {
    int index = cartItems.indexWhere((e) => e.product.id == product.id);
    if (index != -1) {
      cartItems[index].quantity++;
      update();
    }
  }

  void decreaseQty(ProductModel product) {
    int index = cartItems.indexWhere((e) => e.product.id == product.id);
    if (index != -1) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      } else {
        cartItems.removeAt(index);
      }
      update();
    }
  }
}
