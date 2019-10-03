import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:quiz_app/configs/constants.dart';
import 'package:quiz_app/configs/default_sizes.dart';
import 'package:quiz_app/models/ChoiceQuestion.dart';
import 'package:quiz_app/models/TFQuestion.dart';
import 'package:quiz_app/router.dart';
import 'package:quiz_app/viewmodels/question_viewmodel.dart';
import 'package:quiz_app/widgets/animated_circularprogress.dart';
import 'package:quiz_app/widgets/answer_clickable.dart';
import 'package:quiz_app/widgets/back_icon.dart';
import 'package:quiz_app/widgets/error_text.dart';
import 'package:quiz_app/widgets/gradient_bg.dart';

class QuestionScreen extends StatefulWidget {
  final String quizId;
  QuestionScreen({this.quizId});
  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  final sizes = DefaultSizes();
  QuestionModel provider;
  var _answer;

  @override
  void initState() {
    super.initState();
    provider = QuestionModel();
    provider.getQuestions(widget.quizId);
  }

  @override
  Widget build(BuildContext context) {
    sizes.getContext(context);
    return Scaffold(
      body: GradientBackground(
        first: Color(0xff366ae3),
        second: Color(0xff78cbff),
        child: _buildPageLayout(),
      ),
    );
  }

  Widget _buildPageLayout() {
    return SafeArea(
      child: Observer(
        builder: (context) => provider.busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : provider.hasError
                ? ErrorText(
                    errorText: provider.errorMessage,
                  )
                : Column(
                    children: [
                      _buildAppBar(),
                      _buildQuestion(),
                      provider.currentQuestion is ChoiceQuestion
                          ? _buildChoiceAnswers()
                          : _buildTrueFalseAnswers(),
                    ],
                  ),
      ),
    );
  }

  void _goBack() async {
    // dialog ile sor.
    Navigator.pop(context);
  }

  Widget _buildAppBar() {
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
                left: sizes.minPaddingW2 * 2,
                right: sizes.minPaddingW2), // hard-coded
            child: BackIcon(
              color: Colors.white70,
              onTapFunc: _goBack,
            ), // hard-coded
          ),
          _buildScoreboard(),
          Container(
            padding: EdgeInsets.only(
                left: sizes.minPaddingW2,
                right: sizes.minPaddingW2 * 2), // hard-coded
            child: InkWell(
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: sizes.minPaddingW1 * 2, // hard-coded
                ),
                onTap: () {
                  if (!provider.isAnswered) {
                    _markQuestion(null);
                    _animCallback();
                  }
                }
                // skip
                ),
          ),
        ],
      ),
    );
  }

  void _markQuestion(answer) {
    provider.setAnswered(true);
    _answer = answer;
  }

  void _timeUp() async{
    _markQuestion(null);
    _animCallback();
  }

  void _animCallback() async {
    await provider.markQuestion(answer: _answer);
    if (provider.quizFinished) {
      Navigator.pushAndRemoveUntil(
        context,
        Router.generateRoute(
          RouteSettings(
            name: Constants.QuizCompletePath,
            arguments: provider.getResults(),
          ),
        ),
        (Route<dynamic> route) => false,
      );
    }
  }

  Widget _buildQuestion() {
    return Expanded(
      flex: 6,
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  // 1/12 + 1/6 = 1/4 width kaplıyor.
                  padding: EdgeInsets.only(
                      left: sizes.deviceSize.width / 12), // hard-coded
                  child: provider.currentQuestion == null
                      ? Container()
                      : AnimatedCircularProgress(
                          controllerSetter: provider.setController,
                          timeUpHandler: _timeUp,
                          indicatorColor: Color(0xff3b5998),
                          size: sizes.deviceSize.width / 6,
                        ),
                ),
                Container(
                  // 1/2 width
                  width: sizes.deviceSize.width / 2,
                  height: sizes.deviceSize.height / 5,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/crown.png'),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.symmetric(
                    horizontal: sizes.minPaddingW2 * 2,
                    vertical: sizes.minPaddingH2), // hard-coded
                child: Wrap(
                  children: <Widget>[
                    Observer(
                      builder: (context) => AutoSizeText(
                        provider.currentQuestion.question,
                        maxLines: 4,
                        minFontSize:
                            sizes.minPaddingH1.floor().toDouble(), // hard-coded
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreboard() {
    return Container(
      width: sizes.deviceSize.width / 3,
      height: sizes.deviceSize.height / 8,
      child: GridView.count(
        crossAxisCount: ((provider.questionList.length / 2).ceil()).clamp(4, 8),
        children: List.generate(provider.questionList.length, (index) {
          return _buildScore(index);
        }),
      ),
    );
  }

  Widget _buildScore(index) {
    return Observer(
      builder: (context) {
        return Container(
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: provider.scores[index]),
        );
      },
    );
  }

  Widget _buildChoiceAnswers() {
    return Expanded(
      flex: 8,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: sizes.minPaddingW1,
            vertical: sizes.minPaddingH1), // hard-coded
        color: Colors.white,
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Answer(
                answerText:
                    (provider.currentQuestion as ChoiceQuestion).firstChoice,
                index: 1,
                isTrue:
                    (provider.currentQuestion as ChoiceQuestion).answer == 1,
                disabled: provider.isAnswered,
                callback: _animCallback,
                onPressFunc: _markQuestion,
              ),
            ),
            Flexible(
              flex: 1,
              child: Answer(
                answerText:
                    (provider.currentQuestion as ChoiceQuestion).secondChoice,
                callback: _animCallback,
                index: 2,
                isTrue:
                    (provider.currentQuestion as ChoiceQuestion).answer == 2,
                disabled: provider.isAnswered,
                onPressFunc: _markQuestion,
              ),
            ),
            Flexible(
              flex: 1,
              child: Answer(
                answerText:
                    (provider.currentQuestion as ChoiceQuestion).thirdChoice,
                index: 3,
                disabled: provider.isAnswered,
                callback: _animCallback,
                isTrue:
                    (provider.currentQuestion as ChoiceQuestion).answer == 3,
                onPressFunc: _markQuestion,
              ),
            ),
            Flexible(
              flex: 1,
              child: Answer(
                answerText:
                    (provider.currentQuestion as ChoiceQuestion).fourthChoice,
                index: 4,
                disabled: provider.isAnswered,
                callback: _animCallback,
                isTrue:
                    (provider.currentQuestion as ChoiceQuestion).answer == 4,
                onPressFunc: _markQuestion,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrueFalseAnswers() {
    return Expanded(
      flex: 8,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: sizes.minPaddingW1,
            vertical: sizes.minPaddingH1), // hard-coded
        color: Colors.white,
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Answer(
                answerText: 'True',
                index: 0,
                disabled: provider.isAnswered,
                callback: _animCallback,
                isTrue: (provider.currentQuestion as TFQuestion)
                    .answer, // true = true
                onPressFunc: _markQuestion,
              ),
            ),
            Flexible(
              flex: 1,
              child: Answer(
                answerText: 'False',
                index: 1,
                disabled: provider.isAnswered,
                callback: _animCallback,
                isTrue: !((provider.currentQuestion as TFQuestion)
                    .answer), // false = true
                onPressFunc: _markQuestion,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
