import 'package:earling/Bloc/counter_bloc.dart';
import 'package:earling/views/iniciar_sesion.dart';

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
      child: IniciarSesion(),),
    );
  }
}