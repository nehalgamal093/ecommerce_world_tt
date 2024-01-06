part of 'change_theme_bloc.dart';

enum ChangeThemeStatus { light, dark, initial }

class ChangeThemeState extends Equatable {
  ChangeThemeStatus changeThemeStatus;

  ChangeThemeState({
    this.changeThemeStatus = ChangeThemeStatus.light,
  });

  factory ChangeThemeState.initial() {
    return ChangeThemeState(changeThemeStatus: ChangeThemeStatus.light);
  }
  factory ChangeThemeState.inDark() {
    return ChangeThemeState(changeThemeStatus: ChangeThemeStatus.dark);
  }

  @override
  List<Object?> get props => [changeThemeStatus];

  ChangeThemeState copyWith({
    ChangeThemeStatus? changeThemeStatus,
  }) {
    return ChangeThemeState(
      changeThemeStatus: changeThemeStatus ?? this.changeThemeStatus,
    );
  }
}
