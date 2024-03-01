import 'dart:async';
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:world_commerce/repository/add_product.dart';
part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductRepo addProductRepo;
  AddProductBloc({required this.addProductRepo})
      : super(AddProductState.initial()) {
    on<AddProductEv>(_addProductReq);
  }

  FutureOr<void> _addProductReq(
      AddProductEv event, Emitter<AddProductState> emit) async {
    emit(state.copyWith(loadingStatus: AddProductStatus.loading));
    try {
      await addProductRepo.addProduct(
          event.title,
          event.description,
          event.price,
          event.priceAfterDiscount,
          event.ratingAvg,
          event.quantity,
          event.ratingAvg,
          event.sold,
          event.category,
          event.subCategory,
          event.brand,
          event.images);
      emit(state.copyWith(loadingStatus: AddProductStatus.loaded));
    } catch (e) {
      emit(state.copyWith(loadingStatus: AddProductStatus.error));
    }
  }
}
