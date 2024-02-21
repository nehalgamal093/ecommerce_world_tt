// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:world_commerce/models/Product.dart';

class ProductModel {
  List<Product>? products;
  int? pagesPerCategory;
  int? page;
  ProductModel({this.products, this.pagesPerCategory, this.page});
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        products:
            List.from(json['result']).map((e) => Product.fromJson(e)).toList(),
        pagesPerCategory: json['pagePerCategory'],
        page: json['page']);
  }
}
