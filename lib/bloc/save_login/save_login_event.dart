part of 'save_login_bloc.dart';

sealed class SaveLoginEvent extends Equatable {
  const SaveLoginEvent();

  @override
  List<Object> get props => [];
}

class SaveEvent extends SaveLoginEvent {}
