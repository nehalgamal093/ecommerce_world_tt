import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:world_commerce/Services/get_products.dart';
import 'package:world_commerce/models/ProductModel.dart';

import '../change_page/increase_page_bloc.dart';

part 'get_product_event.dart';
part 'get_product_state.dart';

class GetProductBloc extends Bloc<GetProductEvent, GetProductState> {
  GetProducts getProducts;
  final IncreasePageBloc changePageBloc;
  late final StreamSubscription increaseSubscription;
  GetProductBloc({required this.getProducts, required this.changePageBloc})
      : super(GetProductState.initial()) {
    increaseSubscription =
        changePageBloc.stream.listen((IncreasePageState increaseState) {
      add(GetProductsEvent(pageNumber: increaseState.pageNumber));
    });
    on<GetProductsEvent>(
        (GetProductsEvent event, Emitter<GetProductState> emit) async {
      emit(state.copyWith(loadingStatus: ProductsStatus.loading));
      try {
        ProductModel fromApi =
            await getProducts.fetchProducts(event.pageNumber);

        emit(state.copyWith(
            loadingStatus: ProductsStatus.loaded, productModel: fromApi));
      } catch (e) {
        emit(state.copyWith(loadingStatus: ProductsStatus.error));
      }
    });
  }
  @override
  Future<void> close() {
    increaseSubscription.cancel();
    return super.close();
  }
}
