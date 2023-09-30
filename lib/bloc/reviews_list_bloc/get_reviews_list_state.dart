part of 'get_reviews_list_bloc.dart';

sealed class GetReviewsListState extends Equatable {
  const GetReviewsListState();
  
  @override
  List<Object> get props => [];
}

final class GetReviewsListInitial extends GetReviewsListState {}
