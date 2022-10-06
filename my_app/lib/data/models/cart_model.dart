


import 'package:my_app/data/models/product.dart';

class CartModel {
  final ProductModel product;
  CartModel({
    required this.product,
});
  factory CartModel.fromJson(Map<String,dynamic> json) {
    return CartModel(
        product: ProductModel.fromJson(json)
    );
  }
}