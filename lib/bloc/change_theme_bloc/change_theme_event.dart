part of 'change_theme_bloc.dart';

sealed class ChangeThemeEvent extends Equatable {
  const ChangeThemeEvent();

  @override
  List<Object> get props => [];
}

class InitialThemeEvent extends ChangeThemeEvent {}

class ThemeChanged extends ChangeThemeEvent {}
