import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:quiz_app/configs/constants.dart';
import 'package:quiz_app/configs/default_sizes.dart';
import 'package:quiz_app/router.dart';
import 'package:quiz_app/viewmodels/leaderboard_viewmodel.dart';
import 'package:quiz_app/widgets/back_icon.dart';
import 'package:quiz_app/widgets/error_text.dart';
import 'package:quiz_app/widgets/gradient_bg.dart';
import 'package:quiz_app/widgets/king_icon.dart';
import 'dart:math' as math;

class LeaderboardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LeaderboardScreenState();
  }
}

class _LeaderboardScreenState extends State<LeaderboardScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  DefaultSizes sizes;
  LeaderboardModel provider = LeaderboardModel();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this)
      ..addListener(_handleTabChange);
    sizes = DefaultSizes();
    provider.getDailyRankings().then((_) => provider.getTotalRankings());
  }

  void _handleTabChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GradientBackground(
          first: Color(0xfff79f23),
          second: Color(0xfff26907),
          child: _buildLayout(),
        ),
      ),
    );
  }

  void _goBack() {
    Navigator.pop(
      context,
      Router.generateRoute(
        RouteSettings(name: Constants.OpeningPath),
      ),
    );
  }

  Widget _buildLayout() {
    sizes.getContext(context);
    return Observer(
      builder: (context) => provider.busy
          ? Center(
              child: CircularProgressIndicator(),
            )
          : provider.hasError
              ? ErrorText(
                  errorText: provider.errorMessage,
                )
              : Column(
                  children: <Widget>[
                    _buildAppbar(),
                    _buildInfoColumns(),
                    _buildRankings(),
                    _buildUserRank(),
                  ],
                ),
    );
  }

  Widget _buildAppbar() {
    return Expanded(
      flex: 2,
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: BackIcon(
              color: Colors.white70,
              onTapFunc: _goBack,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.white,
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      '    Daily    ',
                      style: TextStyle(
                          fontSize: sizes.minPaddingH2 * 2), // hard-coded
                    ),
                  ),
                  Tab(
                    child: Text(
                      '    Total    ',
                      style: TextStyle(
                          fontSize: sizes.minPaddingH2 * 2), // hard-coded
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumns() {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: EdgeInsets.only(
            top: sizes.minPaddingH1 * 2,
            left: sizes.minPaddingW1 * 2,
            right: sizes.minPaddingW1 * 2), // hard-coded
        child: Column(
          children: <Widget>[
            AutoSizeText(
              'Leaderboards',
              style: TextStyle(fontSize: sizes.minPaddingH1 * 3), // hard-coded
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRankings() {
    return Expanded(
      flex: 10,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: sizes.minPaddingW2),
        child: TabBarView(
          controller: _tabController,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            _buildDailyRankings(),
            _buildTotalRankings(),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyRankings() {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: List.generate(provider.dailyTopHundred.length, (index) {
        var currUser = provider.dailyTopHundred[index];
        return _buildRankTile(
            currUser.rank.toString(),
            currUser.userName,
            currUser.score.ceil().toString(),
            currUser.rank == 1
                ? KingIcon()
                : _buildIcon(
                    Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
                        .withOpacity(1.0)));
      }),
    );
  }

  Widget _buildTotalRankings() {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: List.generate(provider.totalTopHundred.length, (index) {
        var currUser = provider.totalTopHundred[index];
        return _buildRankTile(
            currUser.rank.toString(),
            currUser.userName,
            currUser.score.ceil().toString(),
            currUser.rank == 1
                ? KingIcon()
                : _buildIcon(
                    Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
                        .withOpacity(1.0)));
      }),
    );
  }

  Widget _buildUserRank() {
    final _style = TextStyle(
        color: Colors.white, fontSize: sizes.minPaddingH1 * 1.2); // hard-coded
    bool isDaily = _tabController.index == 0;
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.black87,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              isDaily
                  ? provider.currentUserDailyRank.rank.toString()
                  : provider.currentUserRank.rank.toString(),
              style: _style,
            ),
            Icon(
              // TODO > User's icon
              Icons.person_pin,
              size: sizes.minPaddingH1 * 2,
            ), // hard-coded
            Text(
                isDaily
                    ? provider.currentUserDailyRank.userName
                    : provider.currentUserRank.userName,
                style: _style),
            Text(
                isDaily
                    ? provider.currentUserDailyRank.score.toString()
                    : provider.currentUserRank.score.toString(),
                style: _style),
          ],
        ),
      ),
    );
  }

  Widget _buildRankTile(rank, username, score, icon) {
    final textStyle = TextStyle(color: Colors.white);
    return ListTile(
      leading: Container(
        width: MediaQuery.of(context).size.width / 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              rank,
              style: TextStyle(fontSize: sizes.minPaddingH1), // hard-coded
            ),
            icon
          ], // hard-coded
        ),
      ),
      title: Text(
        username,
        style: textStyle,
      ),
      trailing: Text(
        score,
        style: textStyle,
      ),
    );
  }

  Widget _buildIcon(Color color) {
    return Icon(
      Icons.person_pin,
      size: sizes.minPaddingH1 * 2, // hard-coded
      color: color,
    );
  }
}
