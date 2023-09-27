// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

enum LoginStatus { initial, loading, loaded, error }

class LoginState extends Equatable {
  final LoginStatus loadingStatus;

  const LoginState({
    required this.loadingStatus,
  });

  factory LoginState.initial() {
    return const LoginState(loadingStatus: LoginStatus.initial);
  }

  LoginState copyWith({
    LoginStatus? loadingStatus,
  }) {
    return LoginState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
    );
  }

  @override
  List<Object?> get props => [loadingStatus];
}
