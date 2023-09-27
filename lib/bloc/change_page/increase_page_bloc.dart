import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'increase_page_event.dart';
part 'increase_page_state.dart';

class IncreasePageBloc extends Bloc<IncreasePageEvent, IncreasePageState> {
  IncreasePageBloc() : super(IncreasePageState.initial()) {
    on<IncrementEvent>((event, emit) {
      emit(state.copyWith(pageNumber: state.pageNumber + 1));
    });
    on<DecrementEvent>((event, emit) {
      emit(state.copyWith(pageNumber: state.pageNumber - 1));
    });
  }
}
