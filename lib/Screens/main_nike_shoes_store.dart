import 'package:earling/Screens/shake_transition.dart';
import 'package:earling/models/nike_shoes.dart';
import 'package:earling/views/nike_shoes_details.dart';
import 'package:flutter/material.dart';


class MainNikeShoesStore extends StatelessWidget {
  MainNikeShoesStore({super.key});

// Este ValueNotifier maneja un valor booleano para controlar la visibilidad de la barra
  final ValueNotifier<bool> notifierBottonBarVisible = ValueNotifier(true);

// Esta función se ejecuta cuando se presiona en los zapatos
  void _onSgoesPressed(NikeShoes shoes, BuildContext context) async {
    notifierBottonBarVisible.value = false;
    await Navigator.of(context).push(
        PageRouteBuilder(pageBuilder: (pageBuilder, animation1, animation2) {
      return FadeTransition(
        opacity: animation1,
        child: NikeShoesDetails(),
      );
    }));
    notifierBottonBarVisible.value = true; // Muestra la barra de nuevo al regresar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Image(
                    height: 50,
                    width: 50,
                    image: AssetImage('assets/logo.png')),
                Expanded(
                    child: ListView.builder(
                  itemCount: shoes.length,
                  itemBuilder: (context, index) {
                    final shoesItem = shoes[index];
                    return NikeShoesItem(
                      shoesItem: shoesItem,
                      onTap: () {
                        _onSgoesPressed(shoesItem, context);
                      },
                    );
                  },
                ))
              ],
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: notifierBottonBarVisible,
            child: Container(
                    color: Colors.white.withOpacity(0.7),
                    child: const Row(
                      children: [
                        Expanded(child: Icon(Icons.home)),
                        Expanded(child: Icon(Icons.search)),
                        Expanded(child: Icon(Icons.favorite_border)),
                        Expanded(child: Icon(Icons.shopping_cart)),
                        Expanded(
                            child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://media.licdn.com/dms/image/C4E03AQEdSK4YkDhv0w/profile-displayphoto-shrink_200_200/0/1658904251136?e=2147483647&v=beta&t=MhTo2WknFyVWQcauziui5ku9unaKQAorFpV4Ewh2bHo'),
                        ))
                      ],
                    ),
                  ),
            builder: (context, value, child) {
              return AnimatedPositioned(
                  left: 0,
                  right: 0,
                  bottom: value ? 0.0 : -kToolbarHeight / 4, //-kToolbarHeight / 4,
                  height: kToolbarHeight,
                  duration: const Duration(milliseconds: 250),
                  child: child!
              );
            }
          )
        ],
      ),
    );
  }
}

class NikeShoesItem extends StatelessWidget {
  const NikeShoesItem({
    super.key,
    required this.shoesItem,
    required this.onTap,
  });
  final NikeShoes shoesItem;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    const itenHeight = 100;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: SizedBox(
          height: 160,
          child: Stack(
            fit: StackFit.expand,
            children: [
              //para que me ocupe todo el espacio
              Positioned.fill(
                  child: Hero(
                    tag: 'background_${shoesItem.model}',
                    child: Container(
                                    decoration: BoxDecoration(
                      color: Color(shoesItem.color),
                      borderRadius: BorderRadius.circular(20.0)),
                                  ),
                  )),
              Align(
                  alignment: Alignment.topCenter,
                  child: Hero(
                    tag:  'number_${shoesItem.model}',
                    child: ShakeTransition(
                      //axis:  Axis.vertical
                      //duration const Duration(milliseconds: 1200),
                      //offset:20
                      child: SizedBox(
                        height: itenHeight * 0.6,
                        child: Material(
                          color: Colors.transparent,
                          child: FittedBox(
                            child: Text(
                              shoesItem.modelNumber.toString(),
                              style: TextStyle(color: Colors.black.withOpacity(0.5)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
              Positioned(
                  top: 20,
                  left: 120,
                  child: Hero(
                    tag: 'image_${shoesItem.model}',
                    child: Image.asset(
                        height: itenHeight * 0.7,
                        fit: BoxFit.contain,
                        shoesItem.images.first),
                  )),
              Positioned(
                  bottom: 20, left: 20, child: Icon(Icons.favorite_border)),

              Positioned(
                  bottom: 20, right: 20, child: Icon(Icons.shopping_cart)),
              Positioned(
                left: 0,
                right: 0,
                bottom: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      shoesItem.model,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '\$${shoesItem.oldPrice.toInt().toString()}',
                      style: TextStyle(
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough),
                    ),
                    Text(
                      '\$${shoesItem.currentPrice.toInt().toString()}',
                      style: TextStyle(
                          color: Colors.black,
                        ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
