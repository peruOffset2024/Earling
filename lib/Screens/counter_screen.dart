import 'package:earling/Bloc/counter_bloc.dart';
import 'package:earling/Bloc/counter_event.dart';
import 'package:earling/Bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreenBloc extends StatelessWidget {
  const CounterScreenBloc({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc  = context.read<CounterBloc>();
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(builder: (context, state){
          if(state is CounterValueState){
            return Text('Count: ${state.value}', style: TextStyle(fontSize: 24),
            );
          } return const Text('Counter: 0');
        } ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        counterBloc.add(IncrementEvent()); // disparar evento
      },
      child: Icon(Icons.add),
      ),
    );
  }
}