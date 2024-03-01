part of 'add_product_to_wishlist_bloc.dart';

enum AddToWishlistStatus { initial, loading, loaded, error, liked, unliked }

class AddProductToWishlistState extends Equatable {
  final AddToWishlistStatus addToWishlistStatus;
  final AddToWishListModel addToWishListModel;

  const AddProductToWishlistState({
    required this.addToWishlistStatus,
    required this.addToWishListModel,
  });

  factory AddProductToWishlistState.initial() {
    print('---initial');
    return AddProductToWishlistState(
      addToWishlistStatus: AddToWishlistStatus.initial,
      addToWishListModel: AddToWishListModel(message: '', productIds: []),
    );
  }

  AddProductToWishlistState copyWith({
    AddToWishlistStatus? addToWishlistStatus,
    AddToWishListModel? addToWishListModel,
  }) {
    return AddProductToWishlistState(
      addToWishlistStatus: addToWishlistStatus ?? this.addToWishlistStatus,
      addToWishListModel: addToWishListModel ?? this.addToWishListModel,
    );
  }

  @override
  List<Object?> get props => [addToWishlistStatus, addToWishListModel];
}
