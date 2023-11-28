import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:world_commerce/models/User.dart';

import '../../Services/get_user.dart';

part 'get_user_event.dart';
part 'get_user_state.dart';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  final GetUser getUser;
  GetUserBloc({required this.getUser}) : super(GetUserState.initial()) {
    on<GetUserDataEvent>(getUserData);
  }
  FutureOr<void> getUserData(
      GetUserDataEvent event, Emitter<GetUserState> emit) async {
    emit(state.copyWith(loadingStatus: UserStatus.loading));
    try {
      User data = await getUser.getUserData();
      emit(state.copyWith(loadingStatus: UserStatus.loaded, data: data));
    } catch (e) {
      print(e);
      emit(state.copyWith(loadingStatus: UserStatus.error));
    }
  }
}
