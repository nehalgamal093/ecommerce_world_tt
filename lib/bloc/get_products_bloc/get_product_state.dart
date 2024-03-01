// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_product_bloc.dart';

enum ProductStatus { initial, loading, loaded, error }

// ignore: must_be_immutable
class GetProductState extends Equatable {
  final ProductStatus loadingStatus;
  ProductModel productModel;
  String category;

  GetProductState(
      {required this.loadingStatus,
      required this.productModel,
      required this.category});

  factory GetProductState.initial() {
    return GetProductState(
        loadingStatus: ProductStatus.initial,
        productModel: ProductModel(products: [], pagesPerCategory: 1),
        category: '');
  }

  @override
  List<Object?> get props => [loadingStatus, productModel, category];

  @override
  String toString() =>
      'LoadingStatusGetProducts(loadingStatus: $loadingStatus)';

  GetProductState copyWith(
      {ProductStatus? loadingStatus,
      ProductModel? productModel,
      String? category}) {
    return GetProductState(
        loadingStatus: loadingStatus ?? this.loadingStatus,
        productModel: productModel ?? this.productModel,
        category: category ?? this.category);
  }
}
