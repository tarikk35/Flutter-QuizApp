class CategorySuccess {
  double artSuccess = 0.0;
  double worldSuccess = 0.0;
  double scienceSuccess = 0.0;
  double sportsSuccess = 0.0;
  double historySuccess = 0.0;
  double entertainmentSuccess = 0.0;

  CategorySuccess(
      {this.artSuccess = 0.0,
      this.entertainmentSuccess = 0.0,
      this.historySuccess = 0.0,
      this.scienceSuccess = 0.0,
      this.sportsSuccess = 0.0,
      this.worldSuccess = 0.0});

  CategorySuccess.fromJson(Map<dynamic, dynamic> json) {
    this.artSuccess = double.parse((json['success'] ?? 0.0).toString());
    this.worldSuccess = double.parse((json['success'] ?? 0.0).toString());
    this.scienceSuccess = double.parse((json['success'] ?? 0.0).toString());
    this.sportsSuccess = double.parse((json['success'] ?? 0.0).toString());
    this.historySuccess = double.parse((json['success'] ?? 0.0).toString());
    this.entertainmentSuccess =
        double.parse((json['success'] ?? 0.0).toString());
  }

  double getSuccess(String categoryId) {
    switch (categoryId) {
      case '1':
        return artSuccess;
      case '2':
        return worldSuccess;
      case '3':
        return scienceSuccess;
      case '4':
        return sportsSuccess;
      case '5':
        return historySuccess;
      case '6':
        return entertainmentSuccess;
      default:
        return null;
    }
  }
}
