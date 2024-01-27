part of 'like_bloc.dart';

enum FavoriteStatus { favorite, notFavorite }

class LikeState extends Equatable {
  final FavoriteStatus favProductStatus;

  const LikeState({
    this.favProductStatus = FavoriteStatus.notFavorite,
  });

  factory LikeState.initial() {
    return const LikeState(favProductStatus: FavoriteStatus.notFavorite);
  }

  @override
  List<Object?> get props => [favProductStatus];

  LikeState copyWith({
    FavoriteStatus? favProductStatus,
  }) {
    return LikeState(
      favProductStatus: favProductStatus ?? this.favProductStatus,
    );
  }
}
