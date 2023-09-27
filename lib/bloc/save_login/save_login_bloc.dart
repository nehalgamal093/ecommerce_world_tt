import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'save_login_event.dart';
part 'save_login_state.dart';

class SaveLoginBloc extends Bloc<SaveLoginEvent, SaveLoginState> {
  SaveLoginBloc() : super(SaveLoginState.initial()) {
    on<SaveEvent>(_toggleSave);
  }
  FutureOr<void> _toggleSave(SaveEvent event, Emitter<SaveLoginState> emit) {
    emit(state.copyWith(
        saveLoginStatus: state.saveLoginStatus == SaveLoginStatus.save
            ? SaveLoginStatus.dontSave
            : SaveLoginStatus.save));
  }
}
