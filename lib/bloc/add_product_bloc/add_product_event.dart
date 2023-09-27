part of 'add_product_bloc.dart';

sealed class AddProductEvent extends Equatable {
  const AddProductEvent();

  @override
  List<Object> get props => [];
}

class AddProductEv extends AddProductEvent {
  final String title;
  final String description;
  final int price;
  final int priceAfterDiscount;
  final int ratingAvg;
  final int quantity;
  final int ratingCount;
  final String category;
  final String subCategory;
  final String brand;
  final int sold;
  final List<File> images;

  const AddProductEv(
      {required this.title,
      required this.description,
      required this.price,
      required this.priceAfterDiscount,
      required this.ratingAvg,
      required this.quantity,
      required this.ratingCount,
      required this.sold,
      required this.category,
      required this.subCategory,
      required this.brand,
      required this.images});

  @override
  List<Object> get props => [
        title,
        description,
        price,
        priceAfterDiscount,
        ratingAvg,
        quantity,
        ratingCount,
        sold,
        category,
        subCategory,
        brand,
        images
      ];
}
