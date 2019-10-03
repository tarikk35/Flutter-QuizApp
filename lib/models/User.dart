import 'package:flutter/widgets.dart';
import 'package:quiz_app/models/CategorySuccess.dart';

class User {
  final String userId;
  final String email;
  String fullName;
  String name;
  String iconId;
  double totalScore;
  CategorySuccess categorySuccess;

  User(
      {@required this.userId,
      @required this.email,
      String fullName,
      this.iconId,
      this.totalScore = 0})
      : name = fullName.split(' ')[0];

  User.fromJson(Map<String, dynamic> json)
      : this.userId = json['id'],
        this.email = json['email'],
        this.fullName = json['fullName'],
        this.iconId = json['iconid'] ?? '0',
        this.name = json['fullName'].toString().split(' ')[0],
        this.totalScore = double.parse((json['totalScore'] ?? 0.0).toString()),
        this.categorySuccess = CategorySuccess.fromJson(json['results']??Map<String,dynamic>());
}
