import 'package:auto_size_text/auto_size_text.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:quiz_app/configs/default_sizes.dart';
import 'package:quiz_app/viewmodels/profile_viewmodel.dart';
import 'package:quiz_app/widgets/back_icon.dart';
import 'package:quiz_app/widgets/error_text.dart';
import 'package:quiz_app/widgets/gradient_bg.dart';
import 'package:quiz_app/widgets/progress_indicator.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;
  ProfileScreen({this.userId});
  @override
  State<StatefulWidget> createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  final sizes = DefaultSizes();
  final provider = ProfileModel();
  @override
  Widget build(BuildContext context) {
    sizes.getContext(context);
    provider.getUser();
    return Scaffold(
      body: GradientBackground(
        first: Color(0xff48deb1), //
        second: Color(0xff1f8e6d),
        child: _buildPageLayout(),
      ),
    );
  }

  Widget _buildPageLayout() {
    return SafeArea(
      child: Observer(
        builder: (context) => provider.busy
            ? Center(child: CircularProgressIndicator())
            : provider.hasError
                ? ErrorText(
                    errorText: provider.errorMessage,
                  )
                : Column(
                    children: <Widget>[
                      _buildAppBar(),
                      _buildProfileInfo(),
                      _buildQuizInfo(),
                      _buildQuizScores(),
                    ],
                  ),
      ),
    );
  }

  void _goBack() {
    Navigator.pop(context);
  }

  Widget _buildAppBar() {
    return Expanded(
      flex: 2,
      child: Container(
        padding: EdgeInsets.only(
            left: sizes.minPaddingW1, top: sizes.minPaddingH1), // hardcoded
        // color: Colors.amber,
        child: Row(
          children: <Widget>[
            BackIcon(
              color: Colors.white70,
              onTapFunc: _goBack,
            ), // hardcoded
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Expanded(
      flex: 4,
      child: Row(
        children: <Widget>[
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraint) {
                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(sizes.minPaddingW1),
                  padding: EdgeInsets.all(sizes.minPaddingW1),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey.shade300),
                  child: FlareActor(
                      'images/icons/icon (${int.parse(provider.user.iconId) + 1}).flr'),
                );
              },
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                AutoSizeText(
                  provider.user.name,
                  maxLines: 1,
                  style: TextStyle(fontSize: sizes.minPaddingW1 * 2),
                ),
                AutoSizeText(
                  '# ${provider.rank.toString()}',
                  minFontSize: (sizes.minPaddingW1).ceil().toDouble(),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuizInfo() {
    return Expanded(
      flex: 6,
      child: GridView.count(
        crossAxisCount: 3,
        physics: BouncingScrollPhysics(),
        children: List.generate(6, (i) {
          return CategoryProgressIndicator(
            categoryId: i + 1,
            progressPercent:
                provider.user.categorySuccess.getSuccess('${i + 1}'),
            solvedQuizCount: i * 5,
          );
        }),
      ),
    );
  }

  Widget _buildQuizScores() {
    return Expanded(
      flex: 4,
      child: Container(
        color: Colors.white10,
        padding: EdgeInsets.symmetric(
            horizontal: sizes.minPaddingW1,
            vertical: sizes.minPaddingH1), // hardcoded
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(provider.resultList.length, (i) {
            return _buildScoreCard(index: i);
          }),
        ),
      ),
    );
  }

  Widget _buildScoreCard({index}) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(sizes.minPaddingW2 / 2)),
      child: Container(
        width: sizes.minPaddingW1 *
            6, // hardcoded - height'a göre width - ratio olabilir
        padding:
            EdgeInsets.symmetric(horizontal: sizes.minPaddingW2), // hardcoded
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(sizes.minPaddingW2 / 2),
          gradient: LinearGradient(
              colors: [Color(0xffbab5ad), Color(0xff504e47)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(0.0, -0.5),
              child: Image.asset(
                'images/cup2.png',
                width: sizes.minPaddingW1 * 5,
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black],
                    begin: Alignment.center,
                    end: Alignment.bottomCenter),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                AutoSizeText(
                  provider.resultList[index].score.ceil().toString(),
                  maxLines: 1,
                ),
                AutoSizeText(
                  provider.resultList[index].successRate.toString(),
                  maxLines: 1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
