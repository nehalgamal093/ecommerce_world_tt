// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

enum LoginStatus { initial, loading, loaded, error }

class LoginState extends Equatable {
  final LoginStatus loadingStatus;
  final ResponseModel responseModel;

  const LoginState({required this.loadingStatus, required this.responseModel});

  factory LoginState.initial() {
    return LoginState(
        loadingStatus: LoginStatus.initial,
        responseModel: ResponseModel(
            user: UserModel(email: '', role: '', id: ''),
            token: '',
            message: '',
            id: ''));
  }

  LoginState copyWith(
      {LoginStatus? loadingStatus, ResponseModel? responseModel}) {
    return LoginState(
        loadingStatus: loadingStatus ?? this.loadingStatus,
        responseModel: responseModel ?? this.responseModel);
  }

  @override
  List<Object?> get props => [loadingStatus];
}
