import 'cart_model.dart';

class CartResponseModel {
  String message;
  CartModel? cartModel;
  CartResponseModel({required this.message, required this.cartModel});

  factory CartResponseModel.fromJson(Map<String, dynamic> json) {
    return CartResponseModel(
      message: json['message'],
      cartModel: CartModel.fromJson(json['cart']),
    );
  }
}
