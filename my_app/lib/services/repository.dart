
import '../data/models/product.dart';
import 'network_services.dart';

class Repository {
  final API api;

  Repository({required this.api});
  Future<List<ProductModel>> getProducts() async {
    final productRaw = await api.getProducts();
    return productRaw.map((e) => ProductModel.fromJson(e)).toList();
  }


  Future<List<ProductModel>> getCartItems() async {
    final cartItemsRaw = await api.getCartItems();
    return cartItemsRaw.map((e) => ProductModel.fromJson(e)).toList();
  }

  Future<bool> addItemToCart(ProductModel product) async {
    return await api.addItemToCart(product);
  }

  Future<bool> updateCartItem(ProductModel product, int id) async {
    return await api.updateCartItem(product, id);
  }

  Future<bool> deleteCartItem(int id) async {
    return await api.deleteCartItem(id);
  }


}