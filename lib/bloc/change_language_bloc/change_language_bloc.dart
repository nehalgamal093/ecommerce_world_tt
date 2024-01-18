import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'change_language_event.dart';
part 'change_language_state.dart';

class ChangeLanguageBloc
    extends Bloc<ChangeLanguageEvent, ChangeLanguageState> {
  ChangeLanguageBloc() : super(ChangeLanguageState.initial()) {
    on<LanguageEvent>(_toggleLanguage);
    on<SavedLanguageEvent>(_saveLanguage);
  }
  FutureOr<void> _saveLanguage(
      SavedLanguageEvent event, Emitter<ChangeLanguageState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? enPref = prefs.getString('lang');
    if (enPref == "ar") {
      emit(state.copyWith(langStatus: LangStatus.ar));
    } else {
      emit(state.copyWith(langStatus: LangStatus.en));
    }
  }

  FutureOr<void> _toggleLanguage(
      LanguageEvent event, Emitter<ChangeLanguageState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (state.langStatus == LangStatus.en) {
      emit(state.copyWith(langStatus: LangStatus.ar));
      prefs.setString('lang', 'ar');
    } else {
      emit(state.copyWith(langStatus: LangStatus.en));
      prefs.setString('lang', 'en');
    }
  }
}
