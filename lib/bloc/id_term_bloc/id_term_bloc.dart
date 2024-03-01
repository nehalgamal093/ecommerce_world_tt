import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'id_term_event.dart';
part 'id_term_state.dart';

class IdTermBloc extends Bloc<IdTermEvent, IdTermState> {
  IdTermBloc() : super(IdTermState.initial()) {
    on<IdTerm>((event, emit) {
      emit(state.copyWith(idTerm: event.newId));
      print('idbloc');
    });
  }
}
