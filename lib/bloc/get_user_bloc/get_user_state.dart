part of 'get_user_bloc.dart';

enum UserStatus { initial, loading, loaded, error }

class GetUserState extends Equatable {
  final UserStatus loadingStatus;
  final User data;
  const GetUserState({
    required this.loadingStatus,
    required this.data,
  });

  factory GetUserState.initial() {
    return GetUserState(
        loadingStatus: UserStatus.initial,
        data: User(email: '', phone: '', userName: ''));
  }

  @override
  List<Object?> get props => [loadingStatus, data];

  GetUserState copyWith({
    UserStatus? loadingStatus,
    var data,
  }) {
    return GetUserState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      data: data ?? this.data,
    );
  }

  @override
  String toString() =>
      'LoadingStatusGetProducts(loadingStatus: $loadingStatus)';
}
