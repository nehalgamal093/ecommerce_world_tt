part of 'change_language_bloc.dart';

enum LangStatus { en, ar }

class ChangeLanguageState extends Equatable {
  final LangStatus langStatus;

  const ChangeLanguageState({
    this.langStatus = LangStatus.en,
  });

  factory ChangeLanguageState.initial() {
    return const ChangeLanguageState(langStatus: LangStatus.en);
  }

  @override
  List<Object?> get props => [langStatus];

  ChangeLanguageState copyWith({
    LangStatus? langStatus,
  }) {
    return ChangeLanguageState(
      langStatus: langStatus ?? this.langStatus,
    );
  }
}
