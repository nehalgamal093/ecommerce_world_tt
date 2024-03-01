part of 'get_wishlist_bloc.dart';

enum WishListStatus { initial, loading, loaded, error }

class GetWishlistState extends Equatable {
  final WishListStatus wishListStatus;
  final WishListModel wishListModel;

  const GetWishlistState({
    required this.wishListStatus,
    required this.wishListModel,
  });

  factory GetWishlistState.initial() {
    return GetWishlistState(
      wishListStatus: WishListStatus.initial,
      wishListModel: WishListModel(message: '', likedProducts: []),
    );
  }

  @override
  List<Object?> get props => [wishListStatus, wishListModel];

  @override
  String toString() =>
      'LoadingStatusGetProducts(loadingStatus: $wishListStatus)';

  GetWishlistState copyWith(
      {WishListStatus? wishListStatus,
      WishListModel? wishListModel,
      String? id}) {
    return GetWishlistState(
      wishListStatus: wishListStatus ?? this.wishListStatus,
      wishListModel: wishListModel ?? this.wishListModel,
    );
  }
}
