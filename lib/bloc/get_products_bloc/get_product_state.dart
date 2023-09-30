// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_product_bloc.dart';

enum ProductsStatus { initial, loading, loaded, error }

class GetProductState extends Equatable {
  final ProductsStatus loadingStatus;
  ProductModel productModel;
  String category;

  GetProductState(
      {required this.loadingStatus,
      required this.productModel,
      required this.category});

  factory GetProductState.initial() {
    return GetProductState(
        loadingStatus: ProductsStatus.initial,
        productModel: ProductModel(totalPages: 0, products: []),
        category: '');
  }

  @override
  List<Object?> get props => [loadingStatus, productModel, category];

  @override
  String toString() =>
      'LoadingStatusGetProducts(loadingStatus: $loadingStatus)';

  GetProductState copyWith(
      {ProductsStatus? loadingStatus, ProductModel? productModel}) {
    return GetProductState(
        loadingStatus: loadingStatus ?? this.loadingStatus,
        productModel: productModel ?? this.productModel,
        category: category ?? this.category);
  }
}
