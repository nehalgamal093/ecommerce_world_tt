import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../Services/get_cart_list.dart';
import '../../models/cart_model/CartModel.dart';
import '../../models/cart_model/CartResponseModel.dart';

part 'get_cart_list_event.dart';
part 'get_cart_list_state.dart';

class GetCartListBloc extends Bloc<GetCartListEvent, GetCartListState> {
  GetCartList getCartList;
  GetCartListBloc({required this.getCartList})
      : super(GetCartListState.initial()) {
    on<CartEvent>((CartEvent event, Emitter<GetCartListState> emit) async {
      emit(state.copyWith(loadingStatus: ProductsStatus.loading));
      try {
        CartResponseModel cartResponseModel = await getCartList.fetchCartList();

        emit(state.copyWith(
            loadingStatus: ProductsStatus.loaded,
            cartResponseModel: cartResponseModel));
      } catch (e) {
        emit(state.copyWith(loadingStatus: ProductsStatus.error));
      }
    });
  }
}
