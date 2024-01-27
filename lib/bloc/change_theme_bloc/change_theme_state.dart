part of 'change_theme_bloc.dart';

enum ChangeThemeStatus { light, dark, initial }

class ChangeThemeState extends Equatable {
  final ChangeThemeStatus changeThemeStatus;

  const ChangeThemeState({
    this.changeThemeStatus = ChangeThemeStatus.light,
  });

  factory ChangeThemeState.initial() {
    return const ChangeThemeState(changeThemeStatus: ChangeThemeStatus.light);
  }
  factory ChangeThemeState.inDark() {
    return const ChangeThemeState(changeThemeStatus: ChangeThemeStatus.dark);
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
