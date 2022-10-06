import 'dart:convert';

import 'package:http/http.dart';

import '../data/models/product.dart';

class API {
  final baseUrl = "http://0.0.0.0:8001/api/";

    Future<List<dynamic>> getProducts() async {
    try {
      final response = await get(Uri.parse(baseUrl + "products/"));
      return jsonDecode(response.body);
    } catch (e) {
      return [];
    }
  }


  Future<List<dynamic>> getCartItems() async {
    try {
      final response = await get(Uri.parse(baseUrl + "cart/"));
      return jsonDecode(response.body);
    } catch (e) {
      return [];
    }
  }

  Future<bool> addItemToCart(ProductModel product) async {
    try {
      await post(Uri.parse(baseUrl + "cart/"), body: jsonEncode(product));
      return true;
    }catch (e) {  
      return false;
    }
  }

  Future<bool> updateCartItem(ProductModel updateItem, int id) async {
    try {
      await patch(Uri.parse(baseUrl + "cart/$id"), body: updateItem);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteCartItem(int id) async {
    try {
      await delete(Uri.parse(baseUrl + "cart/$id"));
      return true;
    }catch (e) {
      return false;
    }
  }

}