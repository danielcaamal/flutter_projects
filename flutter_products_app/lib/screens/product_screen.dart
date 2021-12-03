import 'package:flutter/material.dart';
import 'package:flutter_products_app/ui/input_decorations.dart';
import 'package:flutter_products_app/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = 'Product';
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const ProductImage(),
                Positioned(
                    top: 40,
                    left: 20,
                    child: IconButton(
                        iconSize: 40.0,
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.of(context).pop())),
                Positioned(
                    top: 40,
                    right: 20,
                    child: IconButton(
                        iconSize: 40.0,
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Take a picture
                        }))
              ],
            ),
            const _ProductForm(),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.save_outlined), onPressed: () {}),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        width: double.infinity,
        decoration: _boxDecoration(),
        child: Form(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Product name', labelText: 'Name: '),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(
                    hintText: '\$150', labelText: 'Price: '),
              ),
              const SizedBox(
                height: 10,
              ),
              SwitchListTile(
                  title: const Text('Available'),
                  activeColor: Colors.indigo,
                  value: true,
                  onChanged: (value) {}),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() => BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 5,
                offset: const Offset(0, 5))
          ]);
}
