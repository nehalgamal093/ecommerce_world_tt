// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:world_commerce/models/Product.dart';

class ProductModel {
  int? totalPages;
  List<Product>? products;
  ProductModel({
    this.totalPages,
    this.products,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      totalPages: json['pages'],
      products:
          List.from(json['result']).map((e) => Product.fromJson(e)).toList(),
    );
  }
}
