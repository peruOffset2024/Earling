import 'package:earling/provider/provider_productos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MisProductos extends StatefulWidget {
  const MisProductos({super.key});

  @override
  State<MisProductos> createState() => _MisProductosState();
}


class _MisProductosState extends State<MisProductos> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProviderProductos>().obtenerDatos();

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //final cargando = context.watch<ProviderProductos>().isloading;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.amber,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<ProviderProductos>(
                builder: (context, provider,child) { 
                  if(provider.isloading){
                    return const Text('No hay datos');
                  }
          
                  return SizedBox(
                    width: double.infinity,
                    height: size.height * 0.8,
                    child: ListView.builder(
                    itemCount: provider.productos.length,
                    itemBuilder: (context, index){
                      print(' mostrar los datos: ${provider.productos}');
                      final indice = provider.productos[index];
                      return Padding(
                        padding: const  EdgeInsets.only(bottom: 0.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(indice.description, style: const TextStyle(color: Colors.black, ),),
                                        
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Column(
                                    children: [
                                      Image(
                                            width: 100,
                                            height: 100,
                                            image: NetworkImage('https://images.pexels.com/photos/163007/phone-old-year-built-1955-bakelite-163007.jpeg?auto=compress&cs=tinysrgb&w=600')),
                                      Row(children: [
                                        Icon(Icons.shopping_cart)
                                      ],)
                                    ],
                                  ),
                                )
                                
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                 },
                     
              ),
            ],
          ),
        )
      ),
    );
  }
}