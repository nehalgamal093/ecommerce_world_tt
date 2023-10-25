import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_cart_list_event.dart';
part 'get_cart_list_state.dart';

class GetCartListBloc extends Bloc<GetCartListEvent, GetCartListState> {
  GetCartListBloc() : super(GetCartListInitial()) {
    on<GetCartListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
