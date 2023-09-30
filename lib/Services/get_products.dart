import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../models/Product.dart';
import '../models/ProductModel.dart';

class GetProducts {
  Future<ProductModel> fetchProducts(int page, String category) async {
    final response = await http.get(
      Uri.parse('${dotenv.env['PRODUCT_URL']}?page=$page&category=$category'),
    );
    ProductModel productModel =
        ProductModel.fromJson(json.decode(response.body));

    if (response.statusCode == 200) {
      return productModel;
    } else {
      throw Exception('Failed');
    }
  }
}
