class AddToWishListModel {
  String message;
  List<String> productIds;
  AddToWishListModel({required this.message, required this.productIds});

  factory AddToWishListModel.fromJson(Map<String, dynamic> json) {
    return AddToWishListModel(
      message: json['message'],
      productIds: List.from(json['result']).map((e) => e.toString()).toList(),
    );
  }
}
