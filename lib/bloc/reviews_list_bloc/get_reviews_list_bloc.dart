import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_reviews_list_event.dart';
part 'get_reviews_list_state.dart';

class GetReviewsListBloc extends Bloc<GetReviewsListEvent, GetReviewsListState> {
  GetReviewsListBloc() : super(GetReviewsListInitial()) {
    on<GetReviewsListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
