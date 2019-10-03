import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/back_icon.dart';

class EmptyText extends StatelessWidget {
  final String message;
  EmptyText({this.message});
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Align(
          alignment: Alignment(-0.9, -0.9),
          child: BackIcon(
            color: Colors.black54,
            onTapFunc: () => Navigator.pop(context),
          ),
        ),
        Align(
            alignment: Alignment(0.0, 0.0),
            child: AutoSizeText('There\'s no quiz available right now ...')),
      ],
    );
  }
}
