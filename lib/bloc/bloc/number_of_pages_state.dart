// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'number_of_pages_bloc.dart';

enum LoadingStatus { initial, loading, loaded, error }

class NumberOfPagesState extends Equatable {
  final int pages;
  final LoadingStatus loadingStatus;
  const NumberOfPagesState({required this.pages, required this.loadingStatus});

  factory NumberOfPagesState.initial() {
    return const NumberOfPagesState(
        pages: 1, loadingStatus: LoadingStatus.initial);
  }

  @override
  List<Object?> get props => [pages];

  @override
  String toString() => 'LoadingStatusPages(loadingStatus: $pages)';

  NumberOfPagesState copyWith({
    int? pages,
    LoadingStatus? loadingStatus,
  }) {
    return NumberOfPagesState(
      pages: pages ?? this.pages,
      loadingStatus: loadingStatus ?? this.loadingStatus,
    );
  }
}
