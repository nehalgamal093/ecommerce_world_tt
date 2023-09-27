// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'save_login_bloc.dart';

enum SaveLoginStatus { save, dontSave }

class SaveLoginState extends Equatable {
  final SaveLoginStatus saveLoginStatus;

  const SaveLoginState({
    this.saveLoginStatus = SaveLoginStatus.dontSave,
  });

  factory SaveLoginState.initial() {
    return const SaveLoginState(saveLoginStatus: SaveLoginStatus.dontSave);
  }

  @override
  List<Object?> get props => [saveLoginStatus];

  SaveLoginState copyWith({
    SaveLoginStatus? saveLoginStatus,
  }) {
    return SaveLoginState(
      saveLoginStatus: saveLoginStatus ?? this.saveLoginStatus,
    );
  }
}
