class Product {
  String? id;
  String? title;
  String? slug;
  num? price;
  num? priceAfterDiscount;
  num? ratingAvg;
  num? ratingCount;
  String? description;
  num? quantity;
  num? sold;
  String? category;
  String? brand;
  String? subCategory;
  List<String>? images;

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
      this.id});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
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
      images: List.from(json['images'])
          .map((e) => e['attachment_file'].toString())
          .toList(),
    );
  }
}
