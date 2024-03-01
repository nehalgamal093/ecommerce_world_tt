part of 'id_term_bloc.dart';

class IdTermState extends Equatable {
  final String idTerm;

  const IdTermState({required this.idTerm});

  factory IdTermState.initial() {
    return const IdTermState(idTerm: '');
  }

  @override
  List<Object?> get props => [idTerm];

  @override
  String toString() => 'LoadingStatusGetProducts(loadingStatus: $idTerm)';

  IdTermState copyWith({String? idTerm}) {
    return IdTermState(idTerm: idTerm ?? this.idTerm);
  }
}
