import 'package:earling/provider/authentication_provider.dart';
import 'package:earling/views/navegador.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class IniciarSesion extends StatefulWidget {
  const IniciarSesion({super.key});

  @override
  State<IniciarSesion> createState() => _IniciarSesionState();
}

class _IniciarSesionState extends State<IniciarSesion> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _insertUsuario = TextEditingController();

 void _alertUauario() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Error al identificarse',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        content: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ingrese un DNI válido!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.cancel_outlined,
                  size: 24,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 58, 113, 209),
            Color.fromARGB(255, 201, 191, 191)
          ],
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
        )),
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    text: const TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: 'A',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  TextSpan(
                      text: 'Q',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  TextSpan(
                      text: 'N',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  TextSpan(
                      text: 'Q',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black))
                ])),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: _insertUsuario,
                      keyboardType: TextInputType.number,
                      maxLines: 15,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                      ],
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 3)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 3)),
                          hintText: 'Ingrese su Numero de DNI',
                          hintStyle:
                              TextStyle(color: Colors.grey[400], fontSize: 13),
                          prefixIcon: const Icon(
                            Icons.person_pin,
                            color: Colors.white,
                            size: 22,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 15)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Consumer<AuthenticationProvider>(
                  builder: (context, autheProvider, child) {
                    return ElevatedButton(
                        onPressed: autheProvider.authenticated
                            ? () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Navegador()));
                                _insertUsuario.clear();
                              }
                            : () async {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  try {
                                    await autheProvider
                                        .login(_insertUsuario.text);
                                    if (autheProvider.authenticated) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Navegador()));
                                      _insertUsuario.clear();
                                    } else {
                                      _alertUauario();
                                    }
                                  } catch (e) {
                                    _alertUauario();
                                  }
                                }
                              },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            side: const BorderSide(color: Colors.black45),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13))),
                        child: const Text(
                          'Ingresar',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
