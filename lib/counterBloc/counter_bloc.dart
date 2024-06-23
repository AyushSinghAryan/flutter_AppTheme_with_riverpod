import 'package:bloc/bloc.dart';
import 'package:learning_dart/counterBloc/counter_bloc_event.dart';
import 'package:learning_dart/counterBloc/counter_bloc_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0)) {
    on<CounterIncrement>(
      (event, emit) => emit(CounterState(state.counterValue + 1)),
    );
    on<CounterDecrement>(
        (event, emit) => emit(CounterState(state.counterValue - 1)));
  }
}
