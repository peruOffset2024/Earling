import 'dart:convert';

import 'package:earling/models/modelo_productos_dif.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProviderProductos with ChangeNotifier {
  List<ProductosDiferentes> _productos = [];
  //List<ProductosDiferentes> _filtrarProductos = [];
  bool _isLoading = false;

  List<ProductosDiferentes> get productos => _productos;
  bool get isloading => _isLoading;

  Future<void> obtenerDatos() async{
    _isLoading = true;

    try{
      final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

      if(response.statusCode == 200){
        final List<dynamic> data = jsonDecode(response.body);
        _productos = data.map((item) => ProductosDiferentes.fromJson(item)).toList();
       // _filtrarProductos = List.from(_productos);
        notifyListeners();

      } else {
        throw Exception('Error al obtener datos de la API');
      }
    } catch(e){
      print('Error $e');
       throw Exception('La falló al obtener datos');
    }
    _isLoading = false;
  }

  /*void buscarProducto(String product ){
    if(product.isEmpty){
      _filtrarProductos = List.from(_productos);
    } else {
      _filtrarProductos = _productos.where((prodc) => (prodc.description).toLowerCase().contains(product.toLowerCase()) || (prodc.title).toLowerCase().contains(product.toLowerCase())
      ).toList();
      notifyListeners(); 
    }
  }*/



}