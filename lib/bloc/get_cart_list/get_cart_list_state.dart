part of 'get_cart_list_bloc.dart';

enum ProductsStatus { initial, loading, loaded, error }

class GetCartListState extends Equatable {
  final ProductsStatus loadingStatus;
  ProductCartModel productCartModel;

  GetCartListState({
    required this.loadingStatus,
    required this.productCartModel,
  });

  factory GetCartListState.initial() {
    return GetCartListState(
      loadingStatus: ProductsStatus.initial,
      productCartModel: ProductCartModel(products: []),
    );
  }

  @override
  List<Object?> get props => [loadingStatus, productCartModel];

  @override
  String toString() =>
      'LoadingStatusGetProducts(loadingStatus: $loadingStatus)';

  GetCartListState copyWith({
    ProductsStatus? loadingStatus,
    ProductCartModel? productCartModel,
  }) {
    return GetCartListState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      productCartModel: productCartModel ?? this.productCartModel,
    );
  }
}
