// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'increase_page_bloc.dart';

enum LoadingStatus { initial, loading, loaded, error }

class IncreasePageState extends Equatable {
  final int pageNumber;
  final LoadingStatus loadingStatus;
  const IncreasePageState(
      {required this.pageNumber, required this.loadingStatus});
  @override
  String toString() => 'PageNumberStatus(pageNumber: $pageNumber)';
  factory IncreasePageState.initial() {
    return const IncreasePageState(
        pageNumber: 1, loadingStatus: LoadingStatus.initial);
  }

  @override
  List<Object?> get props => [pageNumber, loadingStatus];

  IncreasePageState copyWith({int? pageNumber, LoadingStatus? loadingStatus}) {
    return IncreasePageState(
        pageNumber: pageNumber ?? this.pageNumber,
        loadingStatus: loadingStatus ?? this.loadingStatus);
  }
}
