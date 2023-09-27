// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:world_commerce/repository/login_repo.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepo loginRepo;
  LoginBloc({
    required this.loginRepo,
  }) : super(LoginState.initial()) {
    on<Login>(_loginReq);
  }

  FutureOr<void> _loginReq(Login event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loadingStatus: LoginStatus.loading));
    try {
      await loginRepo.login(event.email, event.password);
      emit(state.copyWith(loadingStatus: LoginStatus.loaded));
    } catch (e) {
      emit(state.copyWith(loadingStatus: LoginStatus.error));
    }
  }
}
