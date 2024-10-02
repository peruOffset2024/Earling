import 'dart:convert';

import 'package:earling/views/Home/models/modelo_salida_guia.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InicioProvider with ChangeNotifier{
  List<SalidaGuia> _guias = [];
  List<SalidaGuia> _filtrarGuias = [];
  bool _estadoCarga = false;
  
  List<SalidaGuia> get guias => _filtrarGuias;
  bool get estadoCarga => _estadoCarga;

  Future<void> obtenerProductos(String dni, String ruc) async {
    _estadoCarga = true;
    notifyListeners();

    try{
      final response = await http.get(Uri.parse('http://190.107.181.163:81/aqnq/ajax/lista_salidas.php?dni=$dni&ruc=$ruc'));
      if(response.statusCode == 200){
        final jsondatos = jsonDecode(response.body);

        if(jsondatos is Map<String, dynamic> && jsondatos.containsKey('error')){
          print('Error: ${jsondatos['error']}');
          _guias = [];
          _filtrarGuias = [];
        } else if (jsondatos is List){
          _guias = jsondatos.map((guia) => SalidaGuia.fromJson(guia)).toList();
          _filtrarGuias = _guias;
        } else {
          throw Exception('Formato de Respuesta Inersperado');
        }

      } else {
        throw Exception('Error al obtener las guias');
      }
    } catch (error){
      print('Error al obtener las guias: $error');
    } finally {
      _estadoCarga = false;
      notifyListeners();
    }

  }

  void buscarGuias (String guiaB){
    if(guiaB.isEmpty){
      _filtrarGuias = _guias; // si no hay texto se muestra la lista completa
    } else {
      _filtrarGuias = _guias.where((guias){
        return guias.cliente.toLowerCase().contains(guiaB.toLowerCase()) || 
        guias.nroGuia.toLowerCase().contains(guiaB.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }


   
}