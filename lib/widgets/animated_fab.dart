import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/configs/constants.dart';
import 'dart:math' as math;

import 'package:quiz_app/configs/default_sizes.dart';

class AnimatedFab extends StatefulWidget {
  final Function onClick;
  final AnimationController rowController;
  const AnimatedFab({Key key, this.onClick, this.rowController})
      : super(key: key);

  @override
  _AnimatedFabState createState() => new _AnimatedFabState();
}

class _AnimatedFabState extends State<AnimatedFab>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Color> _colorAnimation;
  Animation<double> _widthAnimation;
  DefaultSizes sizes;
  bool _animated = false;
  double expandedSize; // hard-coded
  double hiddenSize; // hard-coded

  @override
  void initState() {
    super.initState();
    sizes = DefaultSizes();
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 240));

    _colorAnimation = new ColorTween(
            begin: Colors.greenAccent.shade700, end: Colors.red.shade800)
        .animate(_animationController);

    _widthAnimation = Tween<double>(begin: 0, end: sizes.minPaddingW2 * 4)
        .animate(CurvedAnimation(
            // hard-coded
            parent: _animationController,
            curve: Curves.elasticOut,
            reverseCurve: Curves.decelerate));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    expandedSize = sizes.minPaddingW1 * 12;
    hiddenSize = sizes.minPaddingW1;
    return SizedBox(
      width: expandedSize,
      height: expandedSize,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget child) {
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              _buildOption(Constants.categoryIconPaths[1], 0.0, 1),
              _buildOption(Constants.categoryIconPaths[2], math.pi / 3, 2),
              _buildOption(Constants.categoryIconPaths[3], 2 * math.pi / 3, 3),
              _buildOption(Constants.categoryIconPaths[4], math.pi, 4),
              _buildOption(Constants.categoryIconPaths[5], 4 * math.pi / 3, 5),
              _buildOption(Constants.categoryIconPaths[6], 5 * math.pi / 3, 6),
              _buildFabCore(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildOption(String iconPath, double angle, int index) {
    _onIconClick() {
      widget.onClick(index.toString());
      close();
    }
    return Transform.rotate(
      angle: angle,
      child: Container(
        alignment: Alignment.topCenter,
        child: Container(
          width: _widthAnimation.value,
          height: _widthAnimation.value,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: GestureDetector(
            onTap: _onIconClick,
            child: Transform.rotate(
              angle: -angle,
              child: FlareActor(iconPath),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFabCore() {
    return GestureDetector(
      onTap: _onFabTap,
      child: Container(
        width: sizes.minPaddingW1 * 4, // hard-coded
        height: sizes.minPaddingW1 * 4, // hard-coded
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: _colorAnimation.value),
        child: Icon(
          _animated ? Icons.clear : Icons.play_arrow,
          size: sizes.minPaddingW1 * 3, // hard-coded
        ),
      ),
    );
  }

  open() {
    if (_animationController.isDismissed) {
      if (widget.rowController != null) widget.rowController.forward();
      _animationController.forward();
      _animated = !_animated;
    }
  }

  close() {
    if (_animationController.isCompleted) {
      if (widget.rowController != null) widget.rowController.reverse();
      _animationController.reverse();
      _animated = !_animated;
    }
  }

  _onFabTap() {
    if (_animationController.isDismissed) {
      open();
    } else {
      close();
    }
  }
}
