class CategoryModel {
  int id;
  String name;
  String image;
  String slug;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.slug,
  });
  factory CategoryModel.fromJson(Map<String, dynamic> data) {
    return CategoryModel(
      id: data['id'],
      name: data['name'],
      image: data['image'],
      slug: data['slug'],
    );
  }
}
