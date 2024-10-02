import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthenticationProvider with ChangeNotifier{
  String _userName = '';
  String _conductor = '';
  String _ruc = '';
  bool _authenticated = false;

  String get username => _userName;
  String get conductor => _conductor;
  String get ruc => _ruc;
  bool get authenticated => _authenticated;

  Future<void> authentication(String user) async {
    try{
      await login(user);
    } catch(error){
      print('Error: -> $error');
    }
  }


  Future<void> login(String name) async {
    try{
      final response = await http.get(Uri.parse('http://190.107.181.163:81/aqnq/ajax/login.php?dni=$name'));
      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        if(data['valid'] == true){
          _userName = data['DNI'] ?? '';
          _conductor = data['CONDUCTOR'] ?? '';
          _ruc = data['RUC'] ?? '';
          _authenticated = true;
          notifyListeners();
        } else{
          throw Exception(data['message'] ?? 'Failed to Authenticated');
        }
      } else {
        throw Exception('Failed to Autenticate!');
      }
    } catch(error){
      _userName = '';
      _authenticated = false;
      print('Error: --> $error');
      notifyListeners();
    }
  }

  void logout(){
    _userName = '';
    _authenticated = false;
    notifyListeners();
  }


}
// http://190.107.181.163:81/aqnq/ajax/login.php?dni=72430631