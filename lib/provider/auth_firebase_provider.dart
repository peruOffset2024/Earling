/*import 'package:earling/models/usuario_modelo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AutenticationFirebaseProvider with ChangeNotifier{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Usuario? _usuario;

  Usuario? get usuario => _usuario;

  Future<void> login(String email, String password) async {
    try{
      _auth.signInWithEmailAndPassword(email: email, password: password);
      _usuario = Usuario(uid: _auth.currentUser!.uid, email: email);
      notifyListeners();
    } on FirebaseAuthException catch (e){
      print('Error: -> ${e.code}');
    }
  }

  Future<void> register(String email, String password) async {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      _usuario = Usuario(uid: _auth.currentUser!.uid, email: email);
      notifyListeners();
    } on FirebaseAuthException catch(e){
      print('Error: -> ${e.code}');
    }
  }

  Future<void> logout() async{
    await _auth.signOut();
    _usuario = null;
    notifyListeners();
  }


}*/