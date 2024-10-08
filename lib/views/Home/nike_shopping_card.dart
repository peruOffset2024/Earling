import 'package:flutter/material.dart';
import 'package:earling/Screens/nike_shoes.dart';

const _buttonSizeWidth = 160.0;
const _buttonSizeHeigth = 60.0;
const _buttonCircularSize = 60.0;
const _finalImageSize = 30.0;
const _iamgenSize = 120.0;

class NikeShoppingCard extends StatefulWidget {
  const NikeShoppingCard({super.key, required this.shoes});

  final NikeShoes shoes;

  @override
  State<NikeShoppingCard> createState() => _NikeShoppingCardState();
}

class _NikeShoppingCardState extends State<NikeShoppingCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animationResize;
  late Animation _animationMovementIn;
  late Animation _animationMovementOut;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    _animationResize = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _controller, curve: (const Interval(0.0, 0.4))));
    _animationMovementIn = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve:
            (const Interval(0.3, 0.6, curve: Curves.fastLinearToSlowEaseIn))));
    _animationMovementOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: (const Interval(0.6, 1.0, curve: Curves.elasticIn))));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pop(true);
      }
    });
    super.initState();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildPanel() {
    final size = MediaQuery.of(context).size;
    final currentImageSize = (_iamgenSize * _animationResize.value)
        .clamp(_finalImageSize, _iamgenSize);

    return Container(
      height: (size.height * 0.6 * _animationResize.value)
          .clamp(_buttonCircularSize, size.height * 0.6),
      width: (size.width * _animationResize.value)
          .clamp(_buttonCircularSize, size.width),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(30),
              topRight: const Radius.circular(30),
              bottomLeft: _animationResize.value == 1
                  ? const Radius.circular(0)
                  : const Radius.circular(30),
              bottomRight: _animationResize.value == 1
                  ? const Radius.circular(0)
                  : const Radius.circular(30))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: _animationResize.value == 1
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: _animationResize.value == 1
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    widget.shoes.images.first,
                    height: currentImageSize,
                  ),
                ),
                if (_animationResize.value == 1) ...[
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(widget.shoes.model,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12)),
                        Text('\$${widget.shoes.currentPrice.toString()}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12))
                      ],
                    ),
                  )
                ]
              ],
            ),
          )
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
          final buttonSizeWidth = (_buttonSizeWidth * _animationResize.value)
              .clamp(_buttonCircularSize, _buttonSizeWidth);
          final panelSizeWidth = (size.width * _animationResize.value)
              .clamp(_buttonCircularSize, size.width);
          final buttonSize = _animationResize.value == 1
              ? _buttonCircularSize
              : (_buttonSizeWidth * _animationResize.value)
                  .clamp(_buttonCircularSize, _buttonSizeWidth);

          return Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    color: Colors.black87,
                  ),
                ),
              ),
              Positioned.fill(
                  child: Stack(
                children: [
                  if (_animationMovementIn.value != 1)
                    Positioned(
                      top: size.height * 0.4 +
                          (_animationMovementIn.value * size.height * 0.465),
                      left: size.width / 2 - panelSizeWidth / 2,
                      //bottom: size.height * 0.3,

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
                        width: buttonSize,
                        height: buttonSize
                            .clamp(_buttonCircularSize, _buttonSizeWidth),
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30)),
                                
                                ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                ),
                              ),
                              if (_animationResize.value == 1) ...[
                                SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Text(
                                    'ADD TO CART',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ]
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )),
            ],
          );
        },
      ),
    );
  }
}
