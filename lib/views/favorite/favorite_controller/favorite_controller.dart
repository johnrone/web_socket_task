import 'package:get/get.dart';
import 'package:websocket/models/product_model.dart';

class FavoriteController extends GetxController{
List favorites=[];
void toggleFavorite(int productId) {
    if (favorites.contains(productId)) {
      favorites.remove(productId);
      update();
    } else {
      favorites.add(productId);
      update();
    }
  }
bool isFavorite(ProductModel product) {
    return favorites.contains(product.id);
  }

}