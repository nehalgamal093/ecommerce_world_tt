part of 'like_un_lik_bloc.dart';

sealed class LikeUnLikEvent extends Equatable {
  const LikeUnLikEvent();

  @override
  List<Object> get props => [];
}

class LikeUnlike extends LikeUnLikEvent {
  final String id;
  LikeUnlike({required this.id});

  @override
  List<Object> get props => [id];
}
