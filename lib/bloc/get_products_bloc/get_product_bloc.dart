// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:world_commerce/Services/get_products.dart';
import 'package:world_commerce/models/product_response_model.dart';

part 'get_product_event.dart';
part 'get_product_state.dart';

class GetProductBloc extends Bloc<GetProductEvent, GetProductState> {
  GetProducts getProducts;

  GetProductBloc({required this.getProducts})
      : super(GetProductState.initial()) {
    on<GetProductsEvent>(
        (GetProductsEvent event, Emitter<GetProductState> emit) async {
      emit(state.copyWith(loadingStatus: ProductStatus.loading));
      try {
        ProductModel fromApi =
            await getProducts.fetchProducts(event.pageNumber, event.category);

        emit(state.copyWith(
            loadingStatus: ProductStatus.loaded, productModel: fromApi));
      } catch (e) {
        emit(state.copyWith(loadingStatus: ProductStatus.error));
      }
    });
  }
}
