import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:world_commerce/repository/get_categories_list.dart';

part 'categories_list_event.dart';
part 'categories_list_state.dart';

class CategoriesListBloc
    extends Bloc<CategoriesListEvent, CategoriesListState> {
  final GetCategoriesRepository getCategoriesRepository;
  CategoriesListBloc({required this.getCategoriesRepository})
      : super(CategoriesListState.initial()) {
    on<CategoriesEvent>(listCategoriesReq);
  }
  FutureOr<void> listCategoriesReq(
      CategoriesEvent event, Emitter<CategoriesListState> emit) async {
    emit(state.copyWith(loadingStatus: CategoriesStatus.loading));
    try {
      List<dynamic> data = await getCategoriesRepository.getCategories();
      emit(state.copyWith(loadingStatus: CategoriesStatus.loaded, data: data));
    } catch (e) {
      emit(state.copyWith(loadingStatus: CategoriesStatus.error));
    }
  }
}
