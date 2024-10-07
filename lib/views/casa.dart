import 'package:earling/Screens/nike_shoes.dart';
import 'package:earling/views/prueba.dart';
import 'package:flutter/material.dart';

class CasaHome extends StatefulWidget {
  const CasaHome({super.key});

  @override
  State<CasaHome> createState() => _CasaHomeState();
}

class _CasaHomeState extends State<CasaHome> {
   final ValueNotifier<bool> notifierBottonBarVisible = ValueNotifier(false);

  /* void _openShoppingCart(BuildContext context) async{
    notifierBottonBarVisible.value = false;
    await Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_, animation1, __){
      return FadeTransition(opacity: animation1,
      child: NikeShoppingCard(),
      );
    }));
    notifierBottonBarVisible.value = true;
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(child: Text('vista'),),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
       // _openShoppingCart(context);
      },
      child: Icon(Icons.add),
      ),
    );
  }
}