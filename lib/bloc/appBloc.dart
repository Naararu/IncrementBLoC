import 'package:bloc/bloc.dart';
import 'appEvent.dart';
import 'appState.dart';

class Appbloc extends Bloc<Appevent, Appstate> {
  int nilai = 0; 

  Appbloc() : super(InitialState()) {
    on<NumberIncrementEvent>(NumberIncrementMethod);
  }

  void NumberIncrementMethod(
      NumberIncrementEvent event, Emitter<Appstate> emit) {
    nilai = nilai + event.value;
    emit(UpdateState(nilai));
  }
}