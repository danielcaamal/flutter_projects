import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_products_app/models/models.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  final String _baseURL = 'flutter-projects-867c6-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  bool isLoading = true;
  late Product selectedProduct;

  // FETCH PRODUCTS
  ProductsService() {
    loadProducts();
  }

  Future<List<Product>> loadProducts() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseURL, 'products.json');
    final res = await http.get(url);
    final Map<String, dynamic> productsMap = json.decode(res.body);

    productsMap.forEach((key, value) {
      final tempProduct = Product.fromJson(value);
      tempProduct.id = key;
      products.add(tempProduct);
    });

    isLoading = false;
    notifyListeners();
    // print(products);
    return products;
  }
}
