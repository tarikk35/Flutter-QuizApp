import 'package:auto_size_text/auto_size_text.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/configs/constants.dart';
import 'package:quiz_app/configs/default_sizes.dart';

class CategoryProgressIndicator extends StatelessWidget {
  final double progressPercent;
  final int categoryId;
  final int solvedQuizCount;
  CategoryProgressIndicator(
      {@required this.progressPercent,
      @required this.categoryId,
      @required this.solvedQuizCount});

  final sizes = DefaultSizes();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: sizes.minPaddingW1, vertical: sizes.minPaddingH1),
      child: Stack(
        children: <Widget>[
          _buildBackground(),
          _buildImage(),
          _buildGradientFilter(),
          _buildSolvedQuizzes(),
          _buildProgressIndicator(),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xffc51f5d),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: sizes.minPaddingW2,
                spreadRadius: sizes.minPaddingW2 / 3,
                offset: Offset(sizes.minPaddingW2 / 2, sizes.minPaddingW2 / 2),
              ),
            ]),
      ),
    );
  }

  Widget _buildImage() {
    return Align(
      alignment: Alignment(0.0, 0.0),
      child: Container(
        padding: EdgeInsets.all(sizes.minPaddingW2),
        child: FlareActor(Constants.categoryIconPaths[categoryId]),
      ),
    );
  }

  Widget _buildGradientFilter() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.4),
          ],
          begin: Alignment.center,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Positioned(
      bottom: 0,
      top: 0,
      left: 0,
      right: 0,
      child: CircularProgressIndicator(
        value: progressPercent,
        strokeWidth: sizes.minPaddingW2,
        backgroundColor: Color(0xff9fb6bb),
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
  }

  Widget _buildSolvedQuizzes() {
    return Align(
      alignment: Alignment(0.0, 0.6),
      child: AutoSizeText(
        solvedQuizCount.toString(),
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        textAlign: TextAlign.center,
        minFontSize: (sizes.minPaddingW2 * 2).ceil().toDouble(),
      ),
    );
  }
}
