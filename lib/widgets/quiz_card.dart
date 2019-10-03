import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/configs/default_sizes.dart';
import 'package:quiz_app/models/Quiz.dart';
import 'package:quiz_app/configs/constants.dart';
import 'package:quiz_app/router.dart';

class QuizCard extends StatefulWidget {
  final Quiz quiz;
  final int categoryId;
  QuizCard(this.quiz, this.categoryId);
  @override
  State<StatefulWidget> createState() {
    return _QuizCardState();
  }
}

class _QuizCardState extends State<QuizCard> {
  final sizes = DefaultSizes();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(sizes.minPaddingH1),
          topRight: Radius.circular(sizes.minPaddingH1),
        ),
      ),
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: widget.quiz.result == null
                      ? Constants.cardGradientColors[widget.categoryId]
                      : Constants.cardGradientColors[7],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [-1, 2]),
              borderRadius:
                  BorderRadius.circular(sizes.minPaddingH1) //hard-coded
              ),
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              _buildIcon(),
              widget.quiz.isDone == 1
                  ? _buildResults(
                      widget.quiz.result.score, widget.quiz.result.successRate)
                  : Container(),
              _buildHardnessText(
                  Constants.hardnessLevels[widget.quiz.hardness]),
              _buildHardnessIndicator(widget.quiz.hardness),
            ],
          ),
        ),
        onTap: widget.quiz.result == null ? _showQuizEntryDialog : null,
      ),
    );
  }

  void _openQuestions() {
    Navigator.push(
      context,
      Router.generateRoute(
        RouteSettings(
            name: Constants.QuestionPath, arguments: widget.quiz.quizId),
      ),
    );
  }

  void _showQuizEntryDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
            'You are about to enter ${widget.quiz.title}. If you leave, you cannot enter this quiz again.\nDo you want to enter this Quiz?'),
        actions: <Widget>[
          RaisedButton(
            child: Text('CANCEL'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          RaisedButton(
            child: Text('YES'),
            onPressed: () {
              Navigator.of(context).pop();
              _openQuestions();
            },
          )
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return Expanded(
      flex: 10,
      child: Container(
        margin: EdgeInsets.only(
            top: sizes.minPaddingH1 * 2,
            left: sizes.minPaddingW2,
            right: sizes.minPaddingW2),
        child: Image.asset('images/cup2.png'),
      ),
    );
  }

  Widget _buildHardnessText(text) {
    return Expanded(
      flex: 2,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          child: AutoSizeText(text),
        ),
      ),
    );
  }

  Widget _buildResults(score, rank) {
    return Expanded(
      flex: 3,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: AutoSizeText.rich(
          TextSpan(
            children: [
              TextSpan(text: 'Score : $score\n'),
              TextSpan(text: '#$rank')
            ],
          ),
        ),
      ),
    );
  }

  // Enum ile karşılık gelen renk ve zorluk adı gönderilebilir.
  Widget _buildHardnessIndicator(int hardness) {
    return Expanded(
      flex: 1,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: hardness,
            child: Container(
              color: Constants.hardnessColors[hardness],
            ),
          ),
          Expanded(
            flex: 4 - hardness,
            child: Container(
              color: Colors.grey.shade200,
            ),
          ),
        ],
      ),
    );
  }
}
