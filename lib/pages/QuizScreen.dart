import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:quiz_app/configs/constants.dart';
import 'package:quiz_app/configs/default_sizes.dart';
import 'package:quiz_app/models/Quiz.dart';
import 'package:quiz_app/router.dart';
import 'package:quiz_app/viewmodels/category_viewmodel.dart';
import 'package:quiz_app/widgets/back_icon.dart';
import 'package:quiz_app/widgets/empty_text.dart';
import 'package:quiz_app/widgets/error_text.dart';

import 'package:quiz_app/widgets/gradient_bg.dart';
import 'package:quiz_app/widgets/king_icon.dart';
import 'package:quiz_app/widgets/quiz_card.dart';

class QuizScreen extends StatefulWidget {
  final String categoryId;
  QuizScreen({this.categoryId});
  @override
  State<StatefulWidget> createState() {
    return _QuizScreenState();
  }
}

class _QuizScreenState extends State<QuizScreen> {
  final sizes = DefaultSizes();

  final CategoryModel _categoryProvider = CategoryModel();

  @override
  Widget build(BuildContext context) {
    _categoryProvider.setCategory(widget.categoryId);
    return _buildQuizScreen();
  }

  void _goBack() {
    Navigator.pushReplacement(
      context,
      Router.generateRoute(
        RouteSettings(name: Constants.OpeningPath),
      ),
    );
  }

  Widget _buildQuizScreen() {
    int _category = int.parse(_categoryProvider?.categoryId ?? '0');
    return Scaffold(
      body: GradientBackground(
        first: Constants.categoryGradientColors[_category][0],
        second: Constants.categoryGradientColors[_category][1],
        child: Center(
          child: Observer(
            builder: (context) => _categoryProvider.categoryBusy
                ? CircularProgressIndicator()
                : _categoryProvider.hasError
                    ? ErrorText(
                        errorText: _categoryProvider.errorMessage,
                      )
                    : _categoryProvider.quizzes.length > 0
                        ? _buildQuizPageLayout()
                        : EmptyText(
                            message: 'No quiz left!',
                          ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuizPageLayout() {
    return Column(
      children: <Widget>[
        _buildAppbar(),
        _buildQuizInfo(),
        Expanded(
          flex: 6,
          child: Container(
            child: Carousel(
              provider: _categoryProvider,
            ),
          ),
        ),
        _buildLeaderboard(),
      ],
    );
  }

  Widget _buildAppbar() {
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                left: sizes.minPaddingW1,
                top: sizes.minPaddingH1 * 2), // hard-coded
            child: BackIcon(
              onTapFunc: _goBack,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuizInfo() {
    return Expanded(
      flex: 4,
      child: Column(
        children: <Widget>[
          Text(
            _categoryProvider.selectedQuiz.title,
            style: TextStyle(
                color: Colors.white,
                fontSize: sizes.minPaddingH1 * 2.5), // hard-coded
          ),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: sizes.minPaddingW2), // hard-coded
            child: Observer(
              builder: (context) => _categoryProvider.quizBusy
                  ? CircularProgressIndicator()
                  : Text(
                      '${_categoryProvider.participants} users participated this quiz.',
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: sizes.minPaddingW1), // hard-coded
                    ),
            ),
          ),
          Expanded(
            child: Container(
              padding:
                  EdgeInsets.only(bottom: sizes.minPaddingH1), // hard-coded
              // color: Colors.purple,
              child: _categoryProvider.quizBusy
                  ? Container()
                  : Text(
                      'Success rate : ${_categoryProvider.successRate} %',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: sizes.minPaddingH1 * 1.5), // hard-coded
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(String title, String subtitle, icon) {
    return ListTile(
      leading: icon,
      dense: true,
      title: AutoSizeText(title),
      trailing: AutoSizeText(subtitle),
    );
  }

  Widget _buildIcon(Color color) {
    return Icon(
      Icons.person_pin,
      size: sizes.minPaddingH1 * 2, // hard-coded
      color: color,
    );
  }

  Widget _buildLeaderboard() {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: sizes.minPaddingW1 * 3), // hard-coded
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: _categoryProvider.topThreeUserList.length > 0
              ? List.generate(_categoryProvider.topThreeUserList.length,
                  (index) {
                  return _buildListTile(
                    _categoryProvider.topThreeUserList[index].userName,
                    _categoryProvider.topThreeUserList[index].score.toString(),
                    index == 0 ? KingIcon() : _buildIcon(Colors.white),
                  );
                })
              : [
                  Center(
                    child: Text('Be first to complete this Quiz !'),
                  ),
                ],
        ),
      ),
    );
  }
}

class Carousel extends StatelessWidget {
  final CategoryModel provider;
  Carousel({this.provider});
  final PageController _pageController =
      PageController(initialPage: 0, keepPage: false, viewportFraction: 0.55);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView.builder(
        controller: _pageController,
        itemCount: provider.quizzes.length,
        itemBuilder: (context, index) {
          return animatedItemBuilder(index, provider.quizzes[index]);
        },
        onPageChanged: (index) {
          _pageController.animateToPage(index,
              curve: Curves.decelerate, duration: Duration(milliseconds: 200));
          provider.setQuiz(index);
        },
      ),
    );
  }

  animatedItemBuilder(int index, Quiz quiz) {
    return AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 1;
          if (_pageController.position.haveDimensions) {
            value = _pageController.page - index;
            value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
          }
          return Center(
            child: SizedBox(
              height: Curves.easeOut.transform(value) *
                  MediaQuery.of(context).size.height /
                  3, // hard-coded
              width: Curves.easeOut.transform(value) *
                  MediaQuery.of(context).size.width /
                  2, // hard-coded
              child: child,
            ),
          );
        },
        child: QuizCard(quiz, int.parse(provider.categoryId)));
  }
}
