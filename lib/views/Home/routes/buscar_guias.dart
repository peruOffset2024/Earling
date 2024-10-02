import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class buscarGuias extends StatelessWidget {
  const buscarGuias({
    super.key,
    required this.size,
    required TextEditingController inputSearchController,
  }) : _inputSearchController = inputSearchController;

  final Size size;
  final TextEditingController _inputSearchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        width: size.width *0.9,
        child: TextField(
          controller: _inputSearchController,
          maxLines: 15,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.amber, fontSize: 14),
          decoration: InputDecoration(
            labelText: 'Ingrese su Guía',
            
            filled: true,
            fillColor: Colors.black26,
            prefixIcon: const Icon(Icons.search_outlined, color: Colors.black,),
            labelStyle: const TextStyle(fontSize: 14, color: Colors.black),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.black, width: 1)
            ),
            focusedBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.black, width: 1)
            )
          ),
          onChanged: (value) {
            
          },
        ),
      ),
    );
  }
}