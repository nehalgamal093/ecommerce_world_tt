part of 'brands_list_bloc.dart';

enum BrandsStatus { initial, loading, loaded, error }

class BrandsListState extends Equatable {
  final BrandsStatus loadingStatus;
  final List<dynamic> data;
  const BrandsListState({
    required this.loadingStatus,
    required this.data,
  });

  factory BrandsListState.initial() {
    return const BrandsListState(loadingStatus: BrandsStatus.initial, data: []);
  }

  @override
  List<Object?> get props => [loadingStatus, data];

  BrandsListState copyWith({
    BrandsStatus? loadingStatus,
    var data,
  }) {
    return BrandsListState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      data: data ?? this.data,
    );
  }

  @override
  String toString() =>
      'LoadingStatusGetProducts(loadingStatus: $loadingStatus)';
}
