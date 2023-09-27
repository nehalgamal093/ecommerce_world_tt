// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'increase_page_bloc.dart';

sealed class IncreasePageEvent extends Equatable {
  const IncreasePageEvent();

  @override
  List<Object> get props => [];
}

class IncrementEvent extends IncreasePageEvent {}

class DecrementEvent extends IncreasePageEvent {}
