import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'like_event.dart';
part 'like_state.dart';

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  LikeBloc() : super(LikeState.initial()) {
    on<FavoriteEvent>(_toggleFavorite);
  }
  FutureOr<void> _toggleFavorite(FavoriteEvent event, Emitter<LikeState> emit) {
    emit(state.copyWith(
        favProductStatus: state.favProductStatus == FavoriteStatus.notFavorite
            ? FavoriteStatus.favorite
            : FavoriteStatus.notFavorite));
    print('status is ${state.favProductStatus}');
  }
}
