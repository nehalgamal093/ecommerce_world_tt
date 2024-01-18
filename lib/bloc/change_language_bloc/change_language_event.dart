part of 'change_language_bloc.dart';

sealed class ChangeLanguageEvent extends Equatable {
  const ChangeLanguageEvent();

  @override
  List<Object> get props => [];
}

class LanguageEvent extends ChangeLanguageEvent {}

class SavedLanguageEvent extends ChangeLanguageEvent {}
