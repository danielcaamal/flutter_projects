import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_products_app/models/models.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  final String _baseURL = 'flutter-projects-867c6-default-rtdb.firebaseio.com';
  final List<Product> products = [];

  File? newPicture;

  bool isLoading = true;
  bool isSaving = false;
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

  Future<Product> saveOrCreateProduct(Product product) async {
    isSaving = true;
    notifyListeners();

    if (product.id == null) {
      await createProduct(product);
    } else {
      await updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
    return product;
  }

  Future<String> updateProduct(Product product) async {
    final url = Uri.https(_baseURL, '/products/${product.id}.json');

    await http.put(url, body: jsonEncode(product.toJson()));

    final index = products.indexWhere((element) => element.id == product.id);
    products[index] = product;

    return product.id!;
  }

  Future<String> createProduct(Product product) async {
    final url = Uri.https(_baseURL, '/products.json');

    final res = await http.post(url, body: jsonEncode(product.toJson()));
    final decodeData = json.decode(res.body);
    product.id = decodeData['name'];
    products.add(product);

    // return product.id!;
    return '';
  }

  void updateSelectedProductImage(String path) {
    newPicture = File.fromUri(Uri(path: path));
    selectedProduct.picture = path;
    notifyListeners();
  }

  Future<String?> uploadImage() async {
    String? urlSaved;
    if (newPicture == null) {
      return null;
    }
    isSaving = true;
    notifyListeners();
    try {
      final url = Uri.parse('URL TO UPLOAD IMAGES');
      final imageUploadRequest = http.MultipartRequest('POST', url);
      final file = await http.MultipartFile.fromPath('file', newPicture!.path);

      imageUploadRequest.files.add(file);
      final streamResponse = await imageUploadRequest.send();

      final response = await http.Response.fromStream(streamResponse);
      if (response.statusCode > 201) {
        return null;
      } else {
        final responseData = json.decode(response.body);
        urlSaved = responseData['secure_url'];
      }
    } catch (_) {
      urlSaved = 'https://via.placeholder.com/400x300/f6f6f6';
    }

    newPicture = null;
    return urlSaved;
  }
}
