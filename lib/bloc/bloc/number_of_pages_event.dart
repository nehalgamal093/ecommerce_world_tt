part of 'number_of_pages_bloc.dart';

sealed class NumberOfPagesEvent extends Equatable {
  const NumberOfPagesEvent();

  @override
  List<Object> get props => [];
}

class TotalPagesEvent extends NumberOfPagesEvent {}
