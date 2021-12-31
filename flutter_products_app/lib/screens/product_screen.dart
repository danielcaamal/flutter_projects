import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_products_app/providers/product_form_provider.dart';
import 'package:flutter_products_app/services/services.dart';
import 'package:flutter_products_app/ui/input_decorations.dart';
import 'package:flutter_products_app/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = 'Product';
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductsService>(context);
    // print(productService.selectedProduct.name);

    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productService.selectedProduct),
      child: _ProductsScreenBody(productService: productService),
    );
    // return
  }
}

class _ProductsScreenBody extends StatelessWidget {
  const _ProductsScreenBody({
    Key? key,
    required this.productService,
  }) : super(key: key);

  final ProductsService productService;

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    return Scaffold(
      backgroundColor: Colors.indigo.withOpacity(0.9),
      body: SafeArea(
        child: SingleChildScrollView(
          //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                width: double.infinity,
                decoration: _boxDecoration(top: true),
                child: Center(
                  child: Text(
                    productForm.product.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              Stack(
                children: [
                  ProductImage(
                    url: productService.selectedProduct.picture,
                  ),
                  Positioned(
                      top: 5,
                      left: 20,
                      child: IconButton(
                          iconSize: 40.0,
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.of(context).pop())),
                  Positioned(
                      top: 5,
                      right: 20,
                      child: IconButton(
                          iconSize: 40.0,
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () async {
                            // Take a picture
                            final _picker = ImagePicker();

                            final XFile? image = await _picker.pickImage(
                                source: ImageSource.gallery, imageQuality: 100);

                            if (image == null) {
                              return;
                            }
                            productService
                                .updateSelectedProductImage(image.path);
                          }))
                ],
              ),
              const _ProductForm(),
              const SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: FloatingActionButton(
            backgroundColor: Colors.white,
            child: productService.isSaving
                ? const CircularProgressIndicator(
                    color: Colors.indigo,
                  )
                : const Icon(
                    Icons.save_outlined,
                    color: Colors.indigo,
                  ),
            onPressed: productService.isSaving
                ? null
                : () async {
                    if (!productForm.isValidForm()) {
                      return;
                    } else {
                      final String? imageURL =
                          await productService.uploadImage();
                      if (imageURL != null) {
                        productForm.product.picture = imageURL;
                      }

                      productService.saveOrCreateProduct(productForm.product);
                    }
                  }),
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        width: double.infinity,
        decoration: _boxDecoration(top: false),
        child: Form(
          key: productForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Product name', labelText: 'Name: '),
                initialValue: product.name,
                onChanged: (value) => product.name = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El nombre es obligatorio';
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(
                    hintText: '\$150', labelText: 'Price: '),
                initialValue: '${product.price}',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^(\d+)?\.?\d{0,2}'))
                ],
                onChanged: (value) =>
                    product.price = double.tryParse(value) ?? 0,
              ),
              const SizedBox(
                height: 10,
              ),
              SwitchListTile(
                  title: const Text('Available'),
                  activeColor: Colors.indigo,
                  value: product.available,
                  onChanged: productForm.updateAvailability),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

BoxDecoration _boxDecoration({required bool top}) => BoxDecoration(
        color: Colors.white,
        borderRadius: top
            ? const BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))
            : const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 5))
        ]);
