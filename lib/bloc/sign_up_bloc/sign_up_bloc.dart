import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:world_commerce/repository/signup_repo.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SingUpRepo singUpRepo;
  SignUpBloc({required this.singUpRepo}) : super(SignUpState.initial()) {
    on<SignupEv>(_signUpReq);
  }

  FutureOr<void> _signUpReq(SignupEv event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(loadingStatus: SignUpStatus.loading));
    try {
      await singUpRepo.singUp(
          event.email, event.password, event.phone, event.username);
      emit(state.copyWith(loadingStatus: SignUpStatus.loaded));
    } catch (e) {
      emit(state.copyWith(loadingStatus: SignUpStatus.error));
    }
  }
}
