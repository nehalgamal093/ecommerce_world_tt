part of 'add_product_to_wishlist_bloc.dart';

sealed class AddProductToWishlistEvent extends Equatable {
  const AddProductToWishlistEvent();

  @override
  List<Object> get props => [];
}

class LikeProduct extends AddProductToWishlistEvent {
  final String id;
  const LikeProduct({required this.id});

  @override
  List<Object> get props => [id];
}

class UnlikeProduct extends AddProductToWishlistEvent {
  final String id;
  const UnlikeProduct({required this.id});

  @override
  List<Object> get props => [id];
}

class LikedEvent extends AddProductToWishlistEvent {}

class UnlikedEvent extends AddProductToWishlistEvent {}

class LoadingEvent extends AddProductToWishlistEvent {}
