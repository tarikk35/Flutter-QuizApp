import 'package:mobx/mobx.dart';
import 'package:quiz_app/models/Rank.dart';
import 'package:quiz_app/services/leaderboard_service.dart';

part 'leaderboard_viewmodel.g.dart';

class LeaderboardModel = _LeaderboardModel with _$LeaderboardModel;

abstract class _LeaderboardModel with Store {
  @observable
  bool busy = false;

  @observable
  bool isDaily = true;

  @action
  void setBusy(bool state) {
    busy = state;
  }

  @observable
  bool hasError = false;

  String errorMessage;

  @observable
  List<Rank> totalTopHundred = [];

  @observable
  List<Rank> dailyTopHundred = [];

  @observable
  Rank currentUserRank;

  @observable
  Rank currentUserDailyRank;

  LeaderboardService leaderboardService = LeaderboardService();

  @action
  Future getTotalRankings() async {
    setBusy(true);
    hasError = false;
    try {
      totalTopHundred = await leaderboardService.fetchTotalLeaderboard() ?? [];
      currentUserRank = totalTopHundred.last;
      totalTopHundred.removeLast();
    } catch (e) {
      hasError = true;
      errorMessage = e.toString().split(':')[0];
    }

    setBusy(false);
  }

  @action
  Future getDailyRankings() async {
    setBusy(true);
    hasError = false;
    try {
      dailyTopHundred = await leaderboardService.fetchDailyLeaderboard() ?? [];
      currentUserDailyRank = dailyTopHundred.last;
      dailyTopHundred.removeLast();
    } catch (e) {
      hasError = true;
      errorMessage = e.toString().split(':')[0];
    }
    setBusy(false);
    return null;
  }
}
