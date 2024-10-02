import 'package:earling/Bloc/counter_event.dart';
import 'package:earling/Bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterValueState(0)) {
    // Aquí se maneja el evento usando la nueva sintaxis on<T>
    on<IncrementEvent>((event, emit) {
      final currentState = state as CounterValueState;
      emit(CounterValueState(currentState.value + 1));
    });
  }
}