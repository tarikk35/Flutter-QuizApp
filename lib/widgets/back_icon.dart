import 'package:flutter/material.dart';
import 'package:quiz_app/configs/default_sizes.dart';

class BackIcon extends StatelessWidget {
  final Function onTapFunc;
  final sizes = DefaultSizes();
  final Color color;
  BackIcon({@required this.onTapFunc, @required this.color});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunc,
      child: Icon(
        Icons.arrow_back_ios,
        color: color,
        size: sizes.minPaddingW1 * 2, // hard-coded
      ),
    );
  }
}
