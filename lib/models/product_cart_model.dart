import 'package:world_commerce/models/product_model.dart';

class ProductCartModel {
  List<Product>? products;

  ProductCartModel({this.products});
  factory ProductCartModel.fromJson(Map<String, dynamic> json) {
    return ProductCartModel(
      products: List.from(json['cart']['cartItems'])
          .map((e) => Product.fromJson(e['product']))
          .toList(),
    );
  }
}
