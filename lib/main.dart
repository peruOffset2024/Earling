import 'package:earling/app/app.dart';
import 'package:earling/provider/authentication_provider.dart';
import 'package:earling/provider/provider_productos.dart';
import 'package:earling/views/Home/providers/incio_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AuthenticationProvider()),  
    ChangeNotifierProvider(create: (_) => InicioProvider()), 
    ChangeNotifierProvider(create: (_) => ProviderProductos()),
  ],
  child: const MyApp()));
}
