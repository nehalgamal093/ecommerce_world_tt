// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:world_commerce/repository/get_wishlist.dart';
import '../../models/wishlist/wishlist_model.dart';
part 'get_wishlist_event.dart';
part 'get_wishlist_state.dart';

class GetWishlistBloc extends Bloc<GetWishlistEvent, GetWishlistState> {
  GetWishList getWishList;
  GetWishlistBloc({required this.getWishList})
      : super(GetWishlistState.initial()) {
    on<WishListEvent>(
        (WishListEvent event, Emitter<GetWishlistState> emit) async {
      emit(state.copyWith(wishListStatus: WishListStatus.loading));

      try {
        WishListModel wishList = await getWishList.getWishList();

        emit(state.copyWith(
            wishListStatus: WishListStatus.loaded, wishListModel: wishList));
      } catch (e) {
        emit(state.copyWith(wishListStatus: WishListStatus.error));
      }
    });
  }
}
