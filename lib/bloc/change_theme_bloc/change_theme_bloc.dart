import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'change_theme_event.dart';
part 'change_theme_state.dart';

class ChangeThemeBloc extends Bloc<ChangeThemeEvent, ChangeThemeState> {
  bool isDark;
  ChangeThemeBloc({required this.isDark})
      : super(isDark ? ChangeThemeState.inDark() : ChangeThemeState.initial()) {
    on<InitialThemeEvent>(_initialTheme);
    on<ThemeChanged>(_toggleChangeTheme);
  }

  FutureOr<void> _initialTheme(
      InitialThemeEvent event, Emitter<ChangeThemeState> emit) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isDark = prefs.getBool('isDark') ?? false;
    if (isDark) {
      emit(state.copyWith(changeThemeStatus: ChangeThemeStatus.dark));
    } else {
      emit(state.copyWith(changeThemeStatus: ChangeThemeStatus.light));
    }
  }

  FutureOr<void> _toggleChangeTheme(
      ThemeChanged event, Emitter<ChangeThemeState> emit) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (state.changeThemeStatus == ChangeThemeStatus.light) {
      emit(state.copyWith(changeThemeStatus: ChangeThemeStatus.dark));
      prefs.setBool(
          "isDark", state.changeThemeStatus == ChangeThemeStatus.dark);
    } else {
      emit(state.copyWith(changeThemeStatus: ChangeThemeStatus.light));
      prefs.setBool(
          "isDark", state.changeThemeStatus == ChangeThemeStatus.dark);
    }
  }
}
