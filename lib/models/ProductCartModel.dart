// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:world_commerce/models/Product.dart';

class ProductCartModel {
  List<Product>? products;

  ProductCartModel({this.products});
  factory ProductCartModel.fromJson(Map<String, dynamic> json) {
    return ProductCartModel(
      products:
          List.from(json['product']).map((e) => Product.fromJson(e)).toList(),
    );
  }
}
