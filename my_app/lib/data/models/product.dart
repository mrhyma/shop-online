import 'package:my_app/data/models/category.dart';
import 'package:my_app/data/models/image.dart';

class ProductModel{
  final CategoryModel category;
  final ImageModel image;
  final String name;
  final int webId;
  final String slug;
  final String description;

  ProductModel({
    required this.category,
    required this.image,
    required this.name,
    required this.webId,
    required this.slug,
    required this.description
  });
  factory ProductModel.fromJson(Map<String,dynamic> json) {
    return ProductModel(
        category: CategoryModel.fromJson(json['category']),
        image: ImageModel.fromJson(json['image']),
        name: json['name'] as String,
        webId: int.parse(json['web_id']),
        slug: json['slug'] as String,
        description: json['description'] as String,
    );
  }


}