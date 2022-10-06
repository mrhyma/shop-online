import 'package:equatable/equatable.dart';
import 'package:my_app/data/models/product.dart';

import 'brand.dart';

class ProductInventoryModel extends Equatable{
  final int id;
  final ProductModel product;
  final BrandModel brand;
  final double storePrice;

  const ProductInventoryModel({
    required this.id,
    required this.product,
    required this.brand,
    required this.storePrice,
  });

  factory ProductInventoryModel.fromJson(Map<String,dynamic> json) {
    return ProductInventoryModel(
        id: json['id'],
        product: ProductModel.fromJson(json['product']),
        brand: BrandModel.fromJson(json['brand']),
        storePrice: double.parse(json['store_price'])
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [id, product, brand, storePrice];

}
