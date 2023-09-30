import 'package:world_commerce/models/review.dart';

class ReviewsList {
  List<ReviewModel>? reviews;
  ReviewsList({this.reviews});
  factory ReviewsList.fromJson(Map<String, dynamic> json) {
    return ReviewsList(
      reviews: List.from(json['result'])
          .map((e) => ReviewModel.fromJson(e))
          .toList(),
    );
  }
}
