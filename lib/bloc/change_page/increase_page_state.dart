// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'increase_page_bloc.dart';

class IncreasePageState extends Equatable {
  final int pageNumber;
  const IncreasePageState({required this.pageNumber});
  @override
  String toString() => 'PageNumberStatus(pageNumber: $pageNumber)';
  factory IncreasePageState.initial() {
    return const IncreasePageState(pageNumber: 1);
  }

  @override
  List<Object?> get props => [pageNumber];

  IncreasePageState copyWith({
    int? pageNumber,
  }) {
    return IncreasePageState(
      pageNumber: pageNumber ?? this.pageNumber,
    );
  }
}
