// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignupEv extends SignUpEvent {
  final String email;
  final String password;
  final String phone;
  final String username;

  const SignupEv({
    required this.email,
    required this.password,
    required this.phone,
    required this.username,
  });

  @override
  List<Object> get props => [email, password, phone, username];
}
