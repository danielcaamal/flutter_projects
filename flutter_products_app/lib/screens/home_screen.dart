import 'package:flutter/material.dart';
import 'package:flutter_products_app/models/product_model.dart';
import 'package:flutter_products_app/screens/screens.dart';
import 'package:flutter_products_app/services/products_service.dart';
import 'package:flutter_products_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'Home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductsService>(context);

    if (productService.isLoading) {
      return const LoadingScreen();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: ListView.builder(
          itemCount: productService.products.length,
          itemBuilder: (context, int index) {
            return GestureDetector(
                child: ProductCard(
                  product: productService.products[index],
                ),
                onTap: () {
                  productService.selectedProduct =
                      productService.products[index].copy();
                  Navigator.pushNamed(context, ProductScreen.routeName);
                });
          }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          productService.selectedProduct =
              Product(available: false, name: '', price: 0.00);
          Navigator.pushNamed(context, ProductScreen.routeName);
        },
      ),
    );
  }
}
