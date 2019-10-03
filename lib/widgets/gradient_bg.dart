import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Color first, second;
  final Widget child;
  GradientBackground({this.first, this.second, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [first, second],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}
