part of 'like_un_lik_bloc.dart';

enum LikeUnlikeStatus { initial, loading, loaded, liked, unliked, error }

class LikeUnLikState extends Equatable {
  final LikeUnlikeStatus likeUnlikeStatus;
  final WishListModel wishListModel;

  const LikeUnLikState({
    required this.likeUnlikeStatus,
    required this.wishListModel,
  });

  factory LikeUnLikState.initial() {
    return LikeUnLikState(
      likeUnlikeStatus: LikeUnlikeStatus.initial,
      wishListModel: WishListModel(message: '', likedProducts: []),
    );
  }

  @override
  List<Object?> get props => [likeUnlikeStatus, wishListModel];

  @override
  String toString() =>
      'LoadingStatusGetProducts(loadingStatus: $likeUnlikeStatus)';

  LikeUnLikState copyWith(
      {LikeUnlikeStatus? likeUnlikeStatus,
      WishListModel? wishListModel,
      String? id}) {
    return LikeUnLikState(
      likeUnlikeStatus: likeUnlikeStatus ?? this.likeUnlikeStatus,
      wishListModel: wishListModel ?? this.wishListModel,
    );
  }
}
