import 'package:auto_size_text/auto_size_text.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/configs/default_sizes.dart';

class Answer extends StatefulWidget {
  final String answerText;
  final int index;
  final Function onPressFunc;
  final Function callback;
  final bool disabled;
  final bool isTrue;
  Answer(
      {this.answerText,
      this.isTrue,
      this.disabled,
      this.index,
      this.onPressFunc,
      this.callback});
  @override
  State<StatefulWidget> createState() {
    return _AnswerState();
  }
}

class _AnswerState extends State<Answer> {
  final sizes = DefaultSizes();
  bool _isClicked = false;
  String _animPath;
  String _anim;
  _AnswerState();

  @override
  Widget build(BuildContext context) {
    _animPath = widget.isTrue ? 'images/check.flr' : 'images/cancel.flr';
    _anim = widget.isTrue ? 'Untitled' : 'Error';
    return GestureDetector(
      onTap: () {
        if (!widget.disabled) {
          var answer;
          if (widget.answerText == 'True' || widget.answerText == 'False') {
            answer = widget.answerText == 'True' ? true : false;
          } else {
            answer = widget.index;
          }
          setState(() {
            _isClicked = !_isClicked;
            widget.onPressFunc(answer);
          });
        }
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: widget.disabled &&
                    widget
                        .isTrue // eğer herhangi bir butona tıklandıysa doğru cevabı yeşil yap
                ? Colors.green
                : _isClicked &&
                        !widget.isTrue &&
                        widget
                            .disabled // eğer yanlış cevaba tıklandıysa kırmızı yap
                    ? Colors.red
                    : Colors.white),
        width: double.infinity,
        padding:
            EdgeInsets.symmetric(horizontal: sizes.minPaddingW1), // hard-coded
        child: _isClicked
            ? Stack(
                children: [
                  FlareActor(
                    _animPath,
                    fit: BoxFit.contain,
                    animation: _isClicked
                        ? _anim
                        : null, // 'Error' , 'Success_unchanged'
                    callback: (_) {
                      widget.callback();
                      _isClicked = false;
                    },
                  ),
                ],
              )
            : AutoSizeText(
                widget.answerText, // get from widget .
                style: TextStyle(
                    color: Colors.black87, fontSize: 24), // hard-coded
              ),
      ),
    );
  }
}
