import 'package:quiz_app/models/Result.dart';

class Quiz {
  final String quizId;
  String title;
  int category;
  int hardness;
  int isDone = 0;
  Result result;
  int participants = 0;
  double successRate = 0.0;

  Quiz.fromJson(Map<String, dynamic> json)
      : this.quizId = json['id'],
        this.title = json['title'],
        this.hardness = int.parse(json['level'].toString()) ?? 1,
        this.successRate = double.parse((json['successRate'] ?? 0.0).toString()),
        this.participants = int.parse((json['participation'] ?? 0).toString()),
        this.isDone = json['isDone'],
        this.result =
            json['isDone'] == 1 ? Result.fromJson(json['result']) : null;
}
