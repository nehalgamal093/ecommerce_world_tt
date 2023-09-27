// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_product_bloc.dart';

sealed class GetProductEvent extends Equatable {
  const GetProductEvent();

  @override
  List<Object> get props => [];
}

class GetProductsEvent extends GetProductEvent {
  final int pageNumber;
  GetProductsEvent({
    required this.pageNumber,
  });

  @override
  List<Object> get props => [pageNumber];
}
