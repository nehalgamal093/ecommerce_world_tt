part of 'get_cart_list_bloc.dart';

enum ProductsStatus { initial, loading, loaded, error }

class GetCartListState extends Equatable {
  final ProductsStatus loadingStatus;
  final CartResponseModel cartResponseModel;

  const GetCartListState({
    required this.loadingStatus,
    required this.cartResponseModel,
  });

  factory GetCartListState.initial() {
    return GetCartListState(
        loadingStatus: ProductsStatus.initial,
        cartResponseModel: CartResponseModel(
            message: '', cartModel: CartModel(products: [], userId: '')));
  }

  @override
  List<Object?> get props => [loadingStatus, cartResponseModel];

  @override
  String toString() =>
      'LoadingStatusGetProducts(loadingStatus: $loadingStatus)';

  GetCartListState copyWith({
    ProductsStatus? loadingStatus,
    CartResponseModel? cartResponseModel,
  }) {
    return GetCartListState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      cartResponseModel: cartResponseModel ?? this.cartResponseModel,
    );
  }
}
