// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:world_commerce/models/user_review.dart';

class ReviewModel {
  String? comment;
  String? productId;
  UserReview? userReview;
  ReviewModel({this.comment, this.productId, this.userReview});
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
        comment: json['comment'],
        productId: json['product'],
        userReview: UserReview.fromJson(json['user']));
  }
}
