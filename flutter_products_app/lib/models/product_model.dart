
class Product {
  Product({
    required this.available,
    required this.name,
    this.picture,
    required this.price,
    this.id,
  });

  bool available;
  String name;
  String? picture;
  double price;
  String? id;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        available: json["available"],
        name: json["name"],
        picture: json["picture"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() {
    return {
      "available": available,
      "name": name,
      "picture": picture,
      "price": price,
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }

  Product copy() => Product(
      available: available, name: name, picture: picture, price: price, id: id);
}
