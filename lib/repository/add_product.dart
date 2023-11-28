import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http_parser/http_parser.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AddProductRepo {
  static String errMsg = '';
  Future<dynamic> addProduct(
      String title,
      String description,
      int price,
      int priceAfterDiscount,
      int ratingAvg,
      int quantity,
      int ratingCount,
      int sold,
      String category,
      String subCategory,
      String brand,
      List<File> images) async {
    try {
      var headers = {
        'token':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoibmVoYWwiLCJ1c2VySWQiOiI2NTE0MTMzOTgwYmYzNmMyZDU2NDRjYjgiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE2OTk5NjUwNTd9.BvFmY_lSxkenjRrcG6kEczvILLEI6rdDr5dcQVn_9bM',
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse(dotenv.env['PRODUCT_URL'].toString()));
      request.fields.addAll({
        'title': title,
        'description': description,
        'price': price.toString(),
        'priceAfterDiscount': priceAfterDiscount.toString(),
        'ratingAvg': ratingAvg.toString(),
        'quantity': quantity.toString(),
        'ratingCount': ratingCount.toString(),
        'sold': sold.toString(),
        'category': category,
        'subCategory': subCategory,
        'brand': brand
      });

      for (int i = 0; i < images.length; i++) {
        http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
            'images', images[i].path,
            contentType: MediaType('image', images[i].path.split(".").last));

        request.files.add(multipartFile);
      }

      request.headers.addAll(headers);
      http.StreamedResponse res = await request.send();

      if (res.statusCode == 200) {
        res.stream.transform(utf8.decoder).listen((value) {
          errMsg = value;
        });
      } else {
        res.stream.transform(utf8.decoder).listen((value) {});
        errMsg = 'Failed';
        throw Exception(res);
      }
      // if (result.isEmpty) {
      //   print('=================111${result['errors']['common']['msg']}');
      //   //  print(errMsg);
      //   errMsg = result['errors']['common']['msg'];
      //   throw LoadingException(result['errors']['common']['msg']);
      // }
    } catch (e) {
      rethrow;
    }
  }
}
