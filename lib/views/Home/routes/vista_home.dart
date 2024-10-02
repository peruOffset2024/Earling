import 'package:earling/Screens/main_nike_shoes_store.dart';
import 'package:earling/provider/authentication_provider.dart';
import 'package:earling/views/Home/providers/incio_provider.dart';
import 'package:earling/views/Home/routes/buscar_guias.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final TextEditingController _inputSearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    

    final usuario = context.watch<AuthenticationProvider>().conductor;
    final size = MediaQuery.of(context).size;
    final buscarGuiasProvider = context.watch<InicioProvider>();
    List<String> nombreCompleto = usuario.split(' ');
    String nombUserComplete = nombreCompleto.sublist(0, nombreCompleto.length >= 2 ? 2 : nombreCompleto.length).join(' ');
    
    return Scaffold(
      appBar: AppBar(
        title: RichText(
            text: const TextSpan(children:  <TextSpan>[
          TextSpan(
              text: 'My', style: TextStyle(fontSize: 10, color: Colors.red)),
          TextSpan(
            text: 'Home', style: TextStyle(fontSize: 10, color: Colors.amber)
          ),
          TextSpan(text: 'Page',style: TextStyle(fontSize: 10, color: Colors.green))
        ])),
        automaticallyImplyLeading: false,
        actions: [ Text(nombUserComplete, style: TextStyle(color: Colors.black),
        overflow: TextOverflow.ellipsis,
        )
          
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: Padding(padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            buscarGuias(size: size, inputSearchController: _inputSearchController),
            Expanded(
              child: SizedBox(
                width: size.width,
                child: ListView.builder(
                  itemCount: buscarGuiasProvider.guias.length,
                  itemBuilder: (context, index){
                    final variableGeneral = buscarGuiasProvider.guias[index];
                    if(buscarGuiasProvider.guias.isEmpty){
                      return Text('No hay resultados');
                    }
                    return Padding(padding: EdgeInsets.only(bottom: 0.0),
                    child: Card(
                      color: Colors.white,
                      elevation: 2,
                      child:  Row(
                        children: [
                          //Primera columna
                          Column(children: [
                            Text(variableGeneral.nroGuia)
                
                          ],)
                        ],
                      ),
                    ),
                    );
                  }),
              ),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MainNikeShoesStore()));
            }, child: Icon(Icons.send))
          ],
        ),
        ),
      ),
    );
  }
}


