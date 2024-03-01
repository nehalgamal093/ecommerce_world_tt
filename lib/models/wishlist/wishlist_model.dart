import '../Product.dart';

class WishListModel {
  String message;
  List<Product> likedProducts;
  WishListModel({required this.message, required this.likedProducts});

  factory WishListModel.fromJson(Map<String, dynamic> json) {
    return WishListModel(
        message: json['message'],
        likedProducts:
            List.from(json['result']).map((e) => Product.fromJson(e)).toList());
  }
}
