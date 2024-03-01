import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:world_commerce/repository/get_wishlist.dart';

import '../../models/wishlist/wishlist_model.dart';

part 'like_un_lik_event.dart';
part 'like_un_lik_state.dart';

class LikeUnLikBloc extends Bloc<LikeUnLikEvent, LikeUnLikState> {
  GetWishList getWishList;
  LikeUnLikBloc({required this.getWishList}) : super(LikeUnLikState.initial()) {
    on<LikeUnLikEvent>((event, emit) {
      on<LikeUnlike>((LikeUnlike event, Emitter<LikeUnLikState> emit) async {
        emit(state.copyWith(likeUnlikeStatus: LikeUnlikeStatus.loading));

        try {
          WishListModel wishList = await getWishList.getWishList();
          List<String?> listOfIds =
              wishList.likedProducts.map((e) => e.id).toList();
          if (listOfIds.contains(event.id)) {
            emit(state.copyWith(
                likeUnlikeStatus: LikeUnlikeStatus.liked,
                wishListModel: wishList));
          } else {
            emit(state.copyWith(
                likeUnlikeStatus: LikeUnlikeStatus.unliked,
                wishListModel: wishList));
          }
        } catch (e) {
          emit(state.copyWith(likeUnlikeStatus: LikeUnlikeStatus.error));
        }
      });
    });
  }
}
