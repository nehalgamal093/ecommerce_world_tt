part of 'sign_up_bloc.dart';

enum SignUpStatus { initial, loading, loaded, error }

class SignUpState extends Equatable {
  final SignUpStatus loadingStatus;

  const SignUpState({
    required this.loadingStatus,
  });

  factory SignUpState.initial() {
    return const SignUpState(loadingStatus: SignUpStatus.initial);
  }

  SignUpState copyWith({
    SignUpStatus? loadingStatus,
  }) {
    return SignUpState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
    );
  }

  @override
  List<Object?> get props => [loadingStatus];
}
