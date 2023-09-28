import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:world_commerce/repository/get_subCategories_list.dart';

part 'sub_categories_list_event.dart';
part 'sub_categories_list_state.dart';

class SubCategoriesListBloc
    extends Bloc<SubCategoriesListEvent, SubCategoriesListState> {
  final GetSubCategoriesRepository subCategoriesRepository;
  SubCategoriesListBloc({required this.subCategoriesRepository})
      : super(SubCategoriesListState.initial()) {
    on<SubCategoriesEvent>(listSubCategoriesReq);
  }
  FutureOr<void> listSubCategoriesReq(
      SubCategoriesEvent event, Emitter<SubCategoriesListState> emit) async {
    emit(state.copyWith(loadingStatus: SubCategoriesStatus.loading));
    try {
      List<dynamic> data = await subCategoriesRepository.getSubCategories();
      emit(state.copyWith(
          loadingStatus: SubCategoriesStatus.loaded, data: data));
    } catch (e) {
      emit(state.copyWith(loadingStatus: SubCategoriesStatus.error));
    }
  }
}
