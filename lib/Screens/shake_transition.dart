import 'package:flutter/material.dart';

class ShakeTransition extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Offset offset;

  ShakeTransition({
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.offset = const Offset(10.0, 0.0),
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<Offset>(begin: offset, end: Offset.zero),
      duration: duration,
      curve: Curves.elasticInOut,
      builder: (context, Offset value, child) {
        return Transform.translate(
          offset: value,
          child: child,
        );
      },
      child: child,
    );
  }
}
