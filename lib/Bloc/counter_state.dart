abstract class CounterState {}

class CounterValueState extends CounterState{
  final int value;
  CounterValueState(this.value);
}