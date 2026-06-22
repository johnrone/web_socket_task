import 'package:websocket/models/category_model.dart';

class ProductModel {
  int id;
  String title;
  String slug;
  double price;
  String description;
  List<String> images;
  CategoryModel category;

  ProductModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.price,
    required this.description,
    required this.images,
    required this.category,
    
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      images: List<String>.from(json['images']),
      category: CategoryModel.fromJson(json['category']),
    );
  }
}
