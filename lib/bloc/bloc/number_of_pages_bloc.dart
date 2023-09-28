import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../Services/get_products.dart';
part 'number_of_pages_event.dart';
part 'number_of_pages_state.dart';

class NumberOfPagesBloc extends Bloc<NumberOfPagesEvent, NumberOfPagesState> {
  GetProducts getProducts;

  NumberOfPagesBloc({required this.getProducts})
      : super(NumberOfPagesState.initial()) {
    on<TotalPagesEvent>(totalPagesReq);
  }

  totalPagesReq(TotalPagesEvent event, Emitter<NumberOfPagesState> emit) async {
    emit(state.copyWith(loadingStatus: LoadingStatus.loading));
    try {
      int data = await getProducts.getTotalPages();
      emit(state.copyWith(loadingStatus: LoadingStatus.loaded, pages: data));
    } catch (e) {
      emit(state.copyWith(loadingStatus: LoadingStatus.error));
    }
  }
}
