import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Constants {
  static Map<int, String> hardnessLevels = {
    1: 'Beginner',
    2: 'Intermediate',
    3: 'Advanced',
    4: 'Impossible'
  };

  static Map<int, Color> scoreColors = {
    0: Colors.grey.shade200,
    1: Colors.greenAccent,
    2: Colors.redAccent,
    3: Colors.black54
  };

  static Map<int, Color> hardnessColors = {
    1: Colors.greenAccent.shade700,
    2: Colors.orangeAccent,
    3: Colors.redAccent,
    4: Colors.purpleAccent.shade200
  };

  static Map<int, List<Color>> quizGradientColors = {};

  static Map<int, List<Color>> categoryGradientColors = {
    1: [Color(0xff15B6C8), Color(0xffAF0001)],
    2: [Color(0xff71c1e3), Color(0xff094bb5)],
    3: [Color(0xff37bd79), Color(0xff308fac)], //c7d100
    4: [Color(0xffe1811f), Color(0xffea3a3a)],
    5: [Color(0xffff3838), Color(0xff9e0000)],
    6: [Color(0xfff98aff), Color(0xff37d9fa)]
  };

  static Map<int, List<Color>> cardGradientColors = {
    1: [Color(0xfff1f1d4), Color(0xff9e7c3e)],
    2: [Color(0xff58d16e), Color(0xff008c1a)],
    3: [Color(0xffede268), Color(0xff00d1c3)],
    4: [Color(0xffffe854), Color(0xffde7300)],
    5: [Color(0xffEEBB4E), Color(0xffAD7432)],
    6: [Color(0xff80F0FF), Color(0xffDEC9FF)],
    7: [Color(0xffa6b1b3), Color(0xff2c3e50)],
  };

  static Map<int, String> quizCategories = {
    1: 'Art',
    2: 'World',
    3: 'Science',
    4: 'Sports',
    5: 'History',
    6: 'Entertainment'
  };

  static Map<int, String> categoryIconPaths = {
    1: 'images/categories/category1.flr',
    2: 'images/categories/category2.flr',
    3: 'images/categories/category3.flr',
    4: 'images/categories/category4.flr',
    5: 'images/categories/category5.flr',
    6: 'images/categories/category6.flr',
  };

  static Map<int, String> userIconPaths = {};
  
  static Map<int, String> questionStates = {
    0: 'Not Solved',
    1: 'Correct',
    2: 'Wrong',
    3: 'Skipped'
  };

  static String userToken='Token8'; // TODO: Load token from prefs when initialize

  static String baseUrl = 'http://10.6.1.25/api/';

  static const String LeaderboardPath = '/leaderboard';
  static const String OpeningPath = '/opening';
  static const String ProfilePath = '/profile';
  static const String QuestionPath = '/question';
  static const String QuizCompletePath = '/quizcomplete';
  static const String CategoryPath = '/category';
  static const String LoginPath = '/login';
  static const String SettingsPath = '/settings';
}
