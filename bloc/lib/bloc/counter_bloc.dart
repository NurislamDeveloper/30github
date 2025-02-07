import 'package:bloc/bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) { // Fixed the typo
    on<CounterIncrementPressed>((event, emit) {
      emit(CounterState(state.count + 1)); // Incrementing correctly
    });
    on<CounterDecrementPressed>((event, emit) {
      emit(CounterState(state.count - 1)); // Decrementing correctly
    });
  }
}
