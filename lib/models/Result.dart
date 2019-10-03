class Result {
  final String quizId;
  double score;
  double successRate;
  String quizTitle;
  int quizCategory;

  Result.fromJson(Map<String, dynamic> json)
      : this.quizId = json['qid'],
        this.score = double.parse((json['score'] ?? 0.0).toString()),
        this.successRate =
            double.parse((json['successRate'] ?? 0.0).toString()),
        this.quizTitle = json['title'],
        this.quizCategory = json['category'] is int ? json['category'] : 1;// TODO >
}
