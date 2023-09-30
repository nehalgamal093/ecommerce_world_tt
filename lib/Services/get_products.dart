import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../models/Product.dart';
import '../models/ProductModel.dart';

class GetProducts {
  Future<ProductModel> fetchProducts(int page) async {
    final response = await http.get(
      Uri.parse('${dotenv.env['PRODUCT_URL']}?page=$page'),
    );
    ProductModel productModel =
        ProductModel.fromJson(json.decode(response.body));
    // int totalPages = json.decode(response.body)["pages"];
    // Product data = json.decode(response.body)["result"].map((e) => e).toList();
    if (response.statusCode == 200) {
      print('===${response}');
      return productModel;
    } else {
      print('err===${response}');

      throw Exception('Failed');
    }
  }

  Future<dynamic> getTotalPages() async {
    final response = await http.get(
      Uri.parse(dotenv.env['PRODUCT_URL'].toString()),
    );
    var data = json.decode(response.body)["pages"];
    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception('Failed');
    }
  }
}
