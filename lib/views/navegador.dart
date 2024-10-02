import 'package:earling/Screens/main_nike_shoes_store.dart';
import 'package:earling/Screens/vista_productos.dart';
import 'package:earling/views/Home/routes/vista_home.dart';
import 'package:flutter/material.dart';


class Navegador extends StatefulWidget {
  const Navegador({super.key});

  @override
  State<Navegador> createState() => _NavegadorState();
}

class _NavegadorState extends State<Navegador> {
  int indice = 0;
  List<Widget> vistas = [
     MyHome(),
    MisProductos(),
    MainNikeShoesStore(),
    Text('Pag4')
  ];
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: vistas[indice],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index){
          setState(() {
            indice = index;
          });
        },
        currentIndex: indice,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black.withOpacity(0.9),
        type: BottomNavigationBarType.fixed,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home' ),
        BottomNavigationBarItem(icon: Icon(Icons.local_shipping_rounded), label: 'Transporte'),
        BottomNavigationBarItem(icon: Icon(Icons.timer_sharp),  label: 'Asistencia'),
        BottomNavigationBarItem(icon: Icon(Icons.logout_rounded), label: 'Salir')
      ]),
    );
  }
}