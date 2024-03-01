part of 'id_term_bloc.dart';

sealed class IdTermEvent extends Equatable {
  const IdTermEvent();

  @override
  List<Object> get props => [];
}

class IdTerm extends IdTermEvent {
  final String newId;
  const IdTerm({required this.newId});

  @override
  List<Object> get props => [newId];
}
