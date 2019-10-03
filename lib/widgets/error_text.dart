import 'package:flutter/material.dart';
import 'package:quiz_app/configs/constants.dart';
import 'package:quiz_app/router.dart';

class ErrorText extends StatelessWidget {
  final String errorText;
  ErrorText({this.errorText});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(errorText),
          MaterialButton(
            child: Text('Go to the home page !'),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                Router.generateRoute(
                  RouteSettings(
                    name: Constants.OpeningPath,
                  ),
                ),
                (Route<dynamic> route) => false,
              );
            },
          )
        ],
      ),
    );
  }
}
