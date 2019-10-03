import 'package:flutter/material.dart';
import 'package:quiz_app/pages/LeaderboardScreen.dart';
import 'package:quiz_app/pages/LoginScreen.dart';
import 'package:quiz_app/pages/OpeningScreen.dart';
import 'package:quiz_app/pages/ProfileScreen.dart';
import 'package:quiz_app/pages/QuestionScreen.dart';
import 'package:quiz_app/pages/QuizCompleteScreen.dart';
import 'package:quiz_app/pages/QuizScreen.dart';
import 'package:quiz_app/pages/SettingsScreen.dart';
import 'package:quiz_app/pages/TestPage.dart';
import 'configs/constants.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Constants.LeaderboardPath:
        return MaterialPageRoute(builder: (context) => LeaderboardScreen());
      case Constants.OpeningPath:
        return MaterialPageRoute(
          builder: (context) => OpeningScreen(),
        );
      case Constants.ProfilePath:
        var userId = settings.arguments as String;
        return MaterialPageRoute(
            builder: (context) => ProfileScreen(
                  userId: userId,
                ));
      case Constants.QuestionPath:
        var quizId = settings.arguments as String;
        return MaterialPageRoute(
            builder: (context) => QuestionScreen(
                  quizId: quizId,
                ));
      case Constants.QuizCompletePath:
        var scoreList = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => QuizCompleteScreen(
                  scores: scoreList,
                ));
      case Constants.CategoryPath:
        var categoryid = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => QuizScreen(
                  categoryId: categoryid,
                ));
      case Constants.LoginPath:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case Constants.SettingsPath:
        return MaterialPageRoute(builder: (context) => SettingsPage());
      case 'test':
        return MaterialPageRoute(builder: (context) => TestPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('An error occured trying to open ${settings.name}'),
            ),
          ),
        );
    }
  }
}
