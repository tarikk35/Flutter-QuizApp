import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:quiz_app/configs/constants.dart';
import 'package:quiz_app/configs/default_sizes.dart';
import 'package:quiz_app/router.dart';
import 'package:quiz_app/viewmodels/endscreen_viewmodel.dart';
import 'package:quiz_app/widgets/animated_fab.dart';
import 'package:quiz_app/widgets/back_icon.dart';
import 'package:quiz_app/widgets/gradient_bg.dart';

class QuizCompleteScreen extends StatefulWidget {
  final List<double> maxScores;
  final List<int> scores;
  final List<double> timePercentages;

  QuizCompleteScreen({scores})
      : this.scores = scores[0],
        this.maxScores = scores[1],
        this.timePercentages = scores[2];
  @override
  State<StatefulWidget> createState() {
    return _QuizCompleteScreenState();
  }
}

class _QuizCompleteScreenState extends State<QuizCompleteScreen> {
  DefaultSizes sizes;
  int score = 0;
  final provider = EndscreenModel();
  @override
  void initState() {
    super.initState();
    sizes = DefaultSizes();
    provider.calculateScore(
      widget.scores,
      widget.timePercentages,
      widget.maxScores,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            GradientBackground(
              first: Color(0xffffc7d4),
              second: Color(0xffff6186),
              child: Observer(
                builder: (context) => provider.busy
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : _buildPageLayout(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _goHome() {
    Navigator.pushReplacement(context,
        Router.generateRoute(RouteSettings(name: Constants.OpeningPath)));
  }

  Widget _buildPageLayout() {
    sizes.getContext(context);
    return Column(
      children: <Widget>[
        _buildAppbar(),
        _buildRank(),
        _buildOptions()
      ],
    );
  }

  Widget _buildAppbar() {
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: sizes.minPaddingW1,
                vertical: sizes.minPaddingH1), // hard-coded
            child: BackIcon(
              color: Colors.white70,
              onTapFunc: _goHome,
            ),
          ),
          AutoSizeText(
            'Score : ${provider.score}',
            style: TextStyle(fontSize: sizes.minPaddingH1 * 1.5), // hard-coded
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: sizes.minPaddingW1,
                vertical: sizes.minPaddingH1), // hard-coded
            child: InkWell(
              borderRadius:
                  BorderRadius.circular(sizes.minPaddingH1 * 5), // hard-coded
              child: Icon(
                Icons.share,
                size: sizes.minPaddingH1 * 2, // hard-coded
              ),
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRank() {
    double _width = MediaQuery.of(context).size.width / 1.5;
    double _height = MediaQuery.of(context).size.height / 3;
    return Expanded(
      flex: 8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: sizes.minPaddingH1 * 2,
                left: sizes.minPaddingW1 * 2,
                right: sizes.minPaddingW1 * 2), // hard-coded
            child: AutoSizeText(
              'Congratulations !',
              style: TextStyle(fontSize: sizes.minPaddingH1 * 5), // hard-coded
              maxLines: 1,
            ),
          ),
          Stack(
            children: <Widget>[
              Container(
                width: _width,
                height: _height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/cup2.png'),
                  ),
                ),
              ),
              Positioned(
                left: _width * 0.3,
                right: _width * 0.3,
                top: _height / 20,
                bottom: _height / 2,
                child: Container(
                  width: _width,
                  height: _height / 2,
                  child: AutoSizeText(
                    provider.rank.toString(),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.black26,
                        fontSize: sizes.minPaddingH1 * 10), // hard-coded
                  ),
                ),
              ),
              Positioned(
                child: AutoSizeText(
                  'Abdurrahman Can', // current user
                  maxLines: 1,
                  minFontSize: 8,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                right: _width * 0.34,
                left: _width * 0.34,
                bottom: _height / 16,
                top: _height / 1.14,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOptions() {
    return Expanded(flex: 5, child: _buildFab());
  }

  void _chooseCategoryNav(String categoryId) {
    Navigator.pushReplacement(
      context,
      Router.generateRoute(
        RouteSettings(name: Constants.CategoryPath, arguments: categoryId),
      ),
    );
  }

  Widget _buildFab() {
    return AnimatedFab(
      onClick: _chooseCategoryNav,
      rowController: null,
    );
  }
}
