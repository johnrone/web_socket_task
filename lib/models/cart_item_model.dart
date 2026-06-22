import 'package:websocket/models/product_model.dart';

class CartItem {
  ProductModel product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}