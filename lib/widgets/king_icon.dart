import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quiz_app/configs/default_sizes.dart';

class KingIcon extends StatelessWidget {
  final sizes = DefaultSizes();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizes.minPaddingH1 * 2,
      height: sizes.minPaddingH1 * 2.5, // hard-coded
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            child: Icon(Icons.person_pin,size: sizes.minPaddingH1*2,),
            
          ),
          Positioned(
            top: 0,
            left: sizes.minPaddingH2/4,
            right: sizes.minPaddingH2/4,
            child: Container(
              width: sizes.minPaddingH1*2,
              height: sizes.minPaddingH1*1.2,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/crown.png'), fit: BoxFit.fill),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
