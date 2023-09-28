part of 'sub_categories_list_bloc.dart';

enum SubCategoriesStatus { initial, loading, loaded, error }

class SubCategoriesListState extends Equatable {
  final SubCategoriesStatus loadingStatus;
  final List<dynamic> data;
  const SubCategoriesListState({
    required this.loadingStatus,
    required this.data,
  });

  factory SubCategoriesListState.initial() {
    return const SubCategoriesListState(
        loadingStatus: SubCategoriesStatus.initial, data: []);
  }

  @override
  List<Object?> get props => [loadingStatus, data];

  SubCategoriesListState copyWith({
    SubCategoriesStatus? loadingStatus,
    var data,
  }) {
    return SubCategoriesListState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      data: data ?? this.data,
    );
  }

  @override
  String toString() =>
      'LoadingStatusGetProducts(loadingStatus: $loadingStatus)';
}
