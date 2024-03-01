import '../Product.dart';

class CartModel {
  String userId;
  List<Product?> products;

  CartModel({required this.products, required this.userId});
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      userId: json['user'] ?? '',
      products: List.from(json['cartItems'] ?? [])
          .map((e) => Product.fromJson(e['product']))
          .toList(),
    );
  }
}
