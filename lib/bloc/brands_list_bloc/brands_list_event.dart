part of 'brands_list_bloc.dart';

sealed class BrandsListEvent extends Equatable {
  const BrandsListEvent();

  @override
  List<Object> get props => [];
}

class BrandsEvent extends BrandsListEvent {}
