import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class GetProducts {
  Future<List<dynamic>> fetchProducts(int page) async {
    final response = await http.get(
      Uri.parse('${dotenv.env['PRODUCT_URL']}?page=$page'),
    );
    var data = json.decode(response.body)["result"].map((e) => e).toList();
    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception('Failed');
    }
  }

  Future<dynamic> getTotalPages() async {
    final response = await http.get(
      Uri.parse(dotenv.env['PRODUCT_URL'].toString()),
    );
    var data = json.decode(response.body)["pages"];
    if (response.statusCode == 200) {
      print('dataaaa $data');
      return data;
    } else {
      throw Exception('Failed');
    }
  }
}
