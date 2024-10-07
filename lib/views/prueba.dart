/*import 'package:flutter/material.dart';

const _buttonSizeWidth = 160.0;
const _buttonSizeHeight = 60.0;
const _buttonCircularSize = 60.0;
const _finalImageSize = 30.0;
const _imageSize = 120.0;

class NikeShoes {
  final String model;
  final double currentPrice;
  final List<String> images;

  NikeShoes({required this.model, required this.currentPrice, required this.images});
}

class NikeShoppingCard extends StatefulWidget {
  const NikeShoppingCard({Key? key,}) : super(key: key);



  @override
  State<NikeShoppingCard> createState() => _NikeShoppingCardState();
}

class _NikeShoppingCardState extends State<NikeShoppingCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationResize;
  late Animation<double> _animationMovementIn;
  late Animation<double> _animationMovementOut;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _animationResize = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.3),
    ));
    _animationMovementIn = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.3, 0.6, curve: Curves.fastLinearToSlowEaseIn),
    ));
    _animationMovementOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.7, 1.0, curve: Curves.elasticIn),
    ));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pop(true);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildPanel() {
    return Container(
      height: 300, // Altura fija para evitar tamaños infinitos
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomLeft: _animationResize.value == 1 ? Radius.circular(0) : const Radius.circular(30),
          bottomRight: _animationResize.value == 1 ? Radius.circular(0) : const Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: _animationResize.value == 1 ? MainAxisAlignment.start : MainAxisAlignment.center,
              children: [
                Image.asset(
                  widget.shoes.images.first,
                  height: _imageSize, // Manteniendo el tamaño fijo
                ),
                if (_animationResize.value == 1) ...[
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        widget.shoes.model,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      Text(
                        '\$${widget.shoes.currentPrice.toString()}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      color: Colors.transparent,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final buttonSizeWidth = (_buttonSizeWidth * _animationResize.value).clamp(_buttonCircularSize, _buttonSizeWidth);
          
          return Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(color: Colors.black12),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Stack(
                  children: [
                    if (_animationMovementIn.value != 1)
                      Positioned(
                        top: size.height * 0.4 + (_animationMovementIn.value * size.height * 0.45),
                        width: size.width,
                        left: 0,
                        child: _buildPanel(),
                      ),
                    Positioned(
                      left: size.width / 2 - buttonSizeWidth / 2,
                      bottom: 40.0 - (_animationMovementOut.value * 100),
                      child: InkWell(
                        onTap: () {
                          _controller.forward();
                        },
                        child: Container(
                          width: buttonSizeWidth,
                          height: (_buttonSizeHeight * _animationResize.value).clamp(_buttonCircularSize, _buttonSizeHeight),
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Expanded(
                                  child: Icon(
                                    Icons.shopping_cart,
                                    color: Colors.white,
                                  ),
                                ),
                                if (_animationResize.value == 1) ...[
                                  const SizedBox(width: 10),
                                  const Text(
                                    'ADD TO CART',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
*/