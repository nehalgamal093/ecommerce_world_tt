// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_product_bloc.dart';

enum ProductsStatus { initial, loading, loaded, error }

class GetProductState extends Equatable {
  final ProductsStatus loadingStatus;
  final List<dynamic> data;
  const GetProductState({
    required this.loadingStatus,
    required this.data,
  });

  factory GetProductState.initial() {
    return const GetProductState(
        loadingStatus: ProductsStatus.initial, data: []);
  }

  @override
  List<Object?> get props => [loadingStatus, data];

  GetProductState copyWith({
    ProductsStatus? loadingStatus,
    var data,
  }) {
    return GetProductState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      data: data ?? this.data,
    );
  }

  @override
  String toString() =>
      'LoadingStatusGetProducts(loadingStatus: $loadingStatus)';
}
