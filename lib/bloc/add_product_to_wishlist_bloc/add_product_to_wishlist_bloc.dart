import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:world_commerce/bloc/get_wishlist_bloc/get_wishlist_bloc.dart';
import 'package:world_commerce/models/wishlist/AddToWishListModel.dart';

import 'package:world_commerce/repository/get_wishlist.dart';

import '../id_term_bloc/id_term_bloc.dart';
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
    print('---liked state from add ');

    try {
      AddToWishListModel addtoWishlist =
          await getWishList.addToWishList(event.id);
      emit(state.copyWith(addToWishListModel: addtoWishlist));

      print('added');
    } catch (e) {
      // emit(state.copyWith(addToWishlistStatus: AddToWishlistStatus.error));
      emit(state.copyWith(addToWishlistStatus: AddToWishlistStatus.unliked));
      print('---unliked state from add${e}');
    }
  }

  FutureOr<void> _removeFromWishlist(
      UnlikeProduct event, Emitter<AddProductToWishlistState> emit) async {
    // emit(state.copyWith(addToWishlistStatus: AddToWishlistStatus.loading));
    print('---unliked state from remove');
    emit(state.copyWith(addToWishlistStatus: AddToWishlistStatus.unliked));
    try {
      AddToWishListModel isUnLiked =
          await getWishList.deleteFromWishList(event.id);
      emit(state.copyWith(addToWishListModel: isUnLiked));

      print('deleted');
    } catch (e) {
      // emit(state.copyWith(addToWishlistStatus: AddToWishlistStatus.error));
      emit(state.copyWith(addToWishlistStatus: AddToWishlistStatus.liked));
      print('---liked state from remove${e}');
    }
  }
}
