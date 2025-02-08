

import 'package:bloc/bloc.dart';

class CounterBloc  extends Bloc<CounterState, int >{
CounterBloc () : super(0) {
  on <CounterIncrement>(_counterIncrement);
  on<CounterDecrement> (_counterDecrement);
}
_counterIncrement (CounterIncrement event, Emitter<int> emit ) {
  emit(state +1);
}
_counterDecrement (CounterDecrement event, Emitter <int> emit ) {
  emit(state -1 );
}
}


abstract class CounterState {}
class CounterIncrement extends CounterState {}
class CounterDecrement extends CounterState {}