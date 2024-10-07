import 'package:earling/Bloc/counter_bloc.dart';
import 'package:earling/Screens/main_nike_shoes_store.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter block EXAMPLE',
      theme: ThemeData.light(),
      home: BlocProvider(create: (context) => CounterBloc(),
      child: MainNikeShoesStore(),),
    );
  }
}