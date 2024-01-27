import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../models/reviews.dart';

class Reviews {
  Future<ReviewsList> getReviews() async {
    final response = await http.get(
      Uri.parse(dotenv.env['REVIEW_LIST_URL'].toString()),
    );
    ReviewsList reviewsModel = ReviewsList.fromJson(json.decode(response.body));

    if (response.statusCode == 200) {
      return reviewsModel;
    } else {
      throw Exception('Failed');
    }
  }
}
