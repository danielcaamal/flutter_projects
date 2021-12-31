import 'dart:io';

import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String? url;
  const ProductImage({Key? key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 10.0, right: 10.0),
      child: Container(
        decoration: _productImageDecoration(),
        width: double.infinity,
        child: ClipRRect(child: getImage(url)),
      ),
    );
  }

  BoxDecoration _productImageDecoration() =>
      BoxDecoration(color: Colors.black, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5))
      ]);

  Widget getImage(String? picture) {
    if (picture == null) {
      return Image.asset(
        'assets/no-image.png',
        fit: BoxFit.cover,
      );
    }
    if (picture.startsWith('http')) {
      return FadeInImage(
        fit: BoxFit.fitWidth,
        placeholder: const AssetImage('assets/jar-loading.gif'),
        image: NetworkImage(url!),
      );
    }
    return Image.file(
      File(picture),
      fit: BoxFit.cover,
    );
  }
}
