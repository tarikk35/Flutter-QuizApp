class Rank {
  int rank;
  String userName;
  double score;

  Rank.fromJson(Map<String, dynamic> json)
      : this.userName = json['fullName'],
        this.rank = int.parse((json['rank'] ?? 0).toString()),
        this.score = double.parse((json['totalScore'] ?? 0.0).toString());
}
