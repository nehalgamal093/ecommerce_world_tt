import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:world_commerce/repository/get_brands_list.dart';

part 'brands_list_event.dart';
part 'brands_list_state.dart';

class BrandsListBloc extends Bloc<BrandsListEvent, BrandsListState> {
  final GetBrandsRepository getBrandsRepository;
  BrandsListBloc({required this.getBrandsRepository})
      : super(BrandsListState.initial()) {
    on<BrandsEvent>(listBrandsReq);
  }

  FutureOr<void> listBrandsReq(
      BrandsEvent event, Emitter<BrandsListState> emit) async {
    emit(state.copyWith(loadingStatus: BrandsStatus.loading));
    try {
      List<dynamic> data = await getBrandsRepository.getBrands();
      emit(state.copyWith(loadingStatus: BrandsStatus.loaded, data: data));
    } catch (e) {
      emit(state.copyWith(loadingStatus: BrandsStatus.error));
    }
  }
}
