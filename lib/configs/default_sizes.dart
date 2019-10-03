import 'package:flutter/material.dart';

class DefaultSizes {
  static final DefaultSizes _instance = DefaultSizes._internal();
  factory DefaultSizes() {
    return _instance;
  }
  DefaultSizes._internal();

  Future getContext(BuildContext context) {
    _instance.deviceSize = MediaQuery.of(context).size;
    _calculateSizes();
    return null;
  }

  Size deviceSize;

  double minPaddingW1; // width1

  double minPaddingW2; // width2

  double minPaddingH1; // height1

  double minPaddingH2; // height2

  Future<Null> _calculateSizes() {
    minPaddingW1 = deviceSize.width / 20;
    minPaddingW2 = deviceSize.width / 32;
    minPaddingH1 = deviceSize.height / 40;
    minPaddingH2 = deviceSize.height / 64;
    return null;
  }
}
