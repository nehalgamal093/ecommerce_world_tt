import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:world_commerce/models/wishlist/add_to_wishlist_model.dart';
import 'package:world_commerce/repository/get_wishlist.dart';
part 'add_product_to_wishlist_event.dart';
part 'add_product_to_wishlist_state.dart';

class AddProductToWishlistBloc
    extends Bloc<AddProductToWishlistEvent, AddProductToWishlistState> {
  final GetWishList getWishList;

  AddProductToWishlistBloc({
    required this.getWishList,
  }) : super(AddProductToWishlistState.initial()) {
    on<LikeProduct>(_addToWishList);
    on<UnlikeProduct>(_removeFromWishlist);
  }

  FutureOr<void> _addToWishList(
      LikeProduct event, Emitter<AddProductToWishlistState> emit) async {
    emit(state.copyWith(addToWishlistStatus: AddToWishlistStatus.liked));

    try {
      AddToWishListModel addtoWishlist =
          await getWishList.addToWishList(event.id);
      emit(state.copyWith(addToWishListModel: addtoWishlist));
    } catch (e) {
      // emit(state.copyWith(addToWishlistStatus: AddToWishlistStatus.error));
      emit(state.copyWith(addToWishlistStatus: AddToWishlistStatus.unliked));
    }
  }

  FutureOr<void> _removeFromWishlist(
      UnlikeProduct event, Emitter<AddProductToWishlistState> emit) async {
    emit(state.copyWith(addToWishlistStatus: AddToWishlistStatus.unliked));
    try {
      AddToWishListModel isUnLiked =
          await getWishList.deleteFromWishList(event.id);
      emit(state.copyWith(addToWishListModel: isUnLiked));
    } catch (e) {
      emit(state.copyWith(addToWishlistStatus: AddToWishlistStatus.liked));
    }
  }
}
