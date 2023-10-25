part of 'get_cart_list_bloc.dart';

sealed class GetCartListState extends Equatable {
  const GetCartListState();
  
  @override
  List<Object> get props => [];
}

final class GetCartListInitial extends GetCartListState {}
