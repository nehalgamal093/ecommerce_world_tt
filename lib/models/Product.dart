class Product {
  String? title;
  String? slug;
  int? price;
  int? priceAfterDiscount;
  int? ratingAvg;
  int? ratingCount;
  String? description;
  int? quantity;
  int? sold;
  String? category;
  String? brand;
  String? subCategory;
  List<String>? images;
  List<String>? myReviews;
  String? error;
  Product(
      {this.title,
      this.slug,
      this.price,
      this.priceAfterDiscount,
      this.ratingAvg,
      this.ratingCount,
      this.description,
      this.quantity,
      this.sold,
      this.category,
      this.brand,
      this.subCategory,
      this.images,
      this.myReviews,
      this.error});
  Product.withError(String errorMessage) {
    error = errorMessage;
  }
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        title: json['title'],
        slug: json['slug'],
        price: json['price'],
        priceAfterDiscount: json['priceAfterDiscount'],
        ratingAvg: json['ratingAvg'],
        ratingCount: json['ratingCount'],
        description: json['description'],
        quantity: json['quantity'],
        sold: json['sold'],
        category: json['category'],
        brand: json['brand'],
        subCategory: json['subCategory'],
        images: json['images'],
        myReviews: json['myReviews']);
  }
}
