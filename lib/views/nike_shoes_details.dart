import 'package:earling/Screens/shake_transition.dart';
import 'package:earling/Screens/nike_shoes.dart';
import 'package:earling/views/Home/nike_shopping_card.dart';
import 'package:flutter/material.dart';

class NikeShoesDetails extends StatefulWidget {

  NikeShoesDetails({super.key});

  @override 
  State<NikeShoesDetails> createState() => _NikeShoesDetailsState();
}

class _NikeShoesDetailsState extends State<NikeShoesDetails> {
  final ValueNotifier<bool> notifierBottonBarVisible = ValueNotifier(false);

  void _openShoppingCart(BuildContext context, shoes) async{
    notifierBottonBarVisible.value = false;
    await Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_, animation1, __){
      return FadeTransition(opacity: animation1,
      child: NikeShoppingCard( shoes: shoes[0],),
      );
    }));
    notifierBottonBarVisible.value = true;
  }

  Widget _buildCarrousel(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return SizedBox(
      height: size.height * 0.5,
      child: Stack(
        children: [
          Positioned.fill(
              child: Hero(
            tag: 'background_$shoes', // aqui fijate
            child: Container(
              color: Color(0xFFF6F6F6),
            ),
          )),
          Positioned(
            left: 70,
            right: 70,
            top: 10,
            child: Hero(
              tag: 'number_$shoes',
              child: ShakeTransition(
                //axis: Axi.Vertical,
                duration: Duration(milliseconds: 1400),
                child: Material(
                  color: Colors.transparent,
                  child: FittedBox(
                    child: Text(
                      'number_$shoes',
                      style: TextStyle(color: Colors.black.withOpacity(0.05), fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
          PageView.builder(
            itemCount: shoes.length,
            itemBuilder: (context, index) {
              final itemShoes = shoes[index];
              final tag = index == 0 ? 'image_${itemShoes.model}': 'image_${itemShoes.model}_${index}';
              return Container(
                alignment: Alignment.center,
                child: ShakeTransition(
                  //axis:Axis.Vertical,
                  duration: index ==0 ? const Duration(milliseconds: 900) : Duration.zero,
                  child: Hero(
                    tag: tag,
                    child: Image.asset(
                      height: 200,
                      itemShoes.images[index % itemShoes.images.length],
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifierBottonBarVisible.value = true;
    });

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Image(
            height: 30, width: 30, image: AssetImage('assets/logo.png')),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildCarrousel(context),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShakeTransition(
                        child: Row(
                          children: [
                            Text('Zapatilla model',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18
                                )),
                            Spacer(),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('\$195',
                                    style: TextStyle(
                                        color: Colors.red,
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13)),
                                Text('\$170',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13))
                              ],
                            ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ShakeTransition(
                        duration: Duration(milliseconds: 1100),
                        child: const Text(
                          'AVALIBLE SIZES',
                          style: TextStyle(fontSize: 11),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ShakeTransition(
                        duration: Duration(milliseconds: 1100),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _ShowSizeItem(
                              texto: '6',
                            ),
                            _ShowSizeItem(
                              texto: '7',
                            ),
                            _ShowSizeItem(
                              texto: '8',
                            ),
                            _ShowSizeItem(
                              texto: '9',
                            ),
                            _ShowSizeItem(
                              texto: '10',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'DESCRIPTION',
                        style: TextStyle(fontSize: 11),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          ValueListenableBuilder<bool>(
              valueListenable: notifierBottonBarVisible,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    FloatingActionButton(
                        heroTag: 'fav-1',
                        child: const Icon(Icons.favorite_border_rounded),
                        onPressed: () {}),
                    const Spacer(),
                    FloatingActionButton(
                        heroTag: 'fav-2',
                        backgroundColor: Colors.black,
                        child: const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          _openShoppingCart(context, shoes);
                        })
                  ],
                ),
              ),
              builder: (context, value, child) {
                return AnimatedPositioned(
                    left: 0,
                    right: 0,
                    bottom: value ? 0.0 : -kToolbarHeight / 4,
                    duration: const Duration(milliseconds: 500),
                    child: child!);
              })
        ],
      ),
    );
  }
}

class _ShowSizeItem extends StatelessWidget {
  const _ShowSizeItem({super.key, required this.texto});
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: const Text(
        'US \$189',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
      ),
    );
  }
}
