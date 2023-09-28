part of 'categories_list_bloc.dart';

enum CategoriesStatus { initial, loading, loaded, error }

class CategoriesListState extends Equatable {
  final CategoriesStatus loadingStatus;
  final List<dynamic> data;
  const CategoriesListState({
    required this.loadingStatus,
    required this.data,
  });

  factory CategoriesListState.initial() {
    return const CategoriesListState(
        loadingStatus: CategoriesStatus.initial, data: []);
  }

  @override
  List<Object?> get props => [loadingStatus, data];

  CategoriesListState copyWith({
    CategoriesStatus? loadingStatus,
    var data,
  }) {
    return CategoriesListState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      data: data ?? this.data,
    );
  }

  @override
  String toString() =>
      'LoadingStatusGetProducts(loadingStatus: $loadingStatus)';
}
