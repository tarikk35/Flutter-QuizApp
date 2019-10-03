import 'package:auto_size_text/auto_size_text.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/configs/constants.dart';
import 'package:quiz_app/configs/default_sizes.dart';
import 'package:quiz_app/router.dart';
import 'package:quiz_app/widgets/animated_fab.dart';

class OpeningScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OpeningScreenState();
  }
}

class _OpeningScreenState extends State<OpeningScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Alignment> _transformAnimation;
  DefaultSizes sizes;
  @override
  void initState() {
    super.initState();
    sizes = DefaultSizes();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 140));

    _transformAnimation =
        Tween<Alignment>(begin: Alignment(0, 1), end: Alignment(0, 1.5))
            .animate(CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeOut,
                reverseCurve: Curves.decelerate));
  }

  @override
  Widget build(BuildContext context) {
    sizes.getContext(context);
    return SafeArea(
      child: Scaffold(
        body: WillPopScope(
          // ileride exit dialog yapılacak...
          onWillPop: () async =>
              false, // android'in geri tuşunu override ediyor ve asenkron fonksiyon alabiliyor(diyalog gibi).
          child: Stack(
            children: <Widget>[
              _buildBackgroundImage(),
              _buildAppIcon(),
              _buildAppTitle(),
              _buildFab(_animationController),
              _buildBottomRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/main-bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildAppIcon() {
    return Positioned(
      top: sizes.deviceSize.height / 16,
      left: sizes.deviceSize.width / 6,
      right: sizes.deviceSize.width / 6,
      child: Container(
        width: sizes.deviceSize.width / 3,
        height: sizes.deviceSize.height / 4,
        child: FlareActor('images/app_icon.flr'),
      ),
    );
  }

  Widget _buildAppTitle() {
    return Positioned(
      top: sizes.deviceSize.height / 3,
      left: sizes.deviceSize.width / 8,
      right: sizes.deviceSize.width / 8,
      child: AutoSizeText(
        'Quiz Application',
        maxLines: 1,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black87,
          fontSize: sizes.minPaddingH1 * 5, // hard-coded
        ),
      ),
    );
  }

  Widget _buildFab(controller) {
    return new Positioned(
      bottom: sizes.deviceSize.height / 10,
      right: sizes.deviceSize.width / 4,
      left: sizes.deviceSize.width / 4,
      child: AnimatedFab(
        onClick: _chooseCategoryNav,
        rowController: _animationController,
      ),
    );
  }

  Widget _buildBottomRow() {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Align(
          alignment: _transformAnimation.value,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: sizes.minPaddingW1,
                    vertical: sizes.minPaddingH1), // hard-coded
                child: IconButton(
                  onPressed: _goToProfile,
                  icon: Icon(Icons.person),
                  iconSize: sizes.minPaddingH1 * 2, // hard-coded
                ),
              ),
              Container(
                child: IconButton(
                  onPressed: _goToLeaderboard,
                  icon: Icon(Icons.whatshot),
                  iconSize: sizes.minPaddingH1 * 3, // hard-coded
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: sizes.minPaddingW1,
                    vertical: sizes.minPaddingH1), // hard-coded
                child: IconButton(
                  onPressed: _goToSettings,
                  icon: Icon(Icons.settings),
                  iconSize: sizes.minPaddingH1 * 2, // hard-coded
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _chooseCategoryNav(String categoryId) {
    Navigator.push(
      context,
      Router.generateRoute(
        RouteSettings(name: Constants.CategoryPath, arguments: categoryId),
      ),
    );
  }

  void _goToProfile() {
    // eğer argüman yoksa kendi profilini yükleyecek.
    Navigator.push(
      context,
      Router.generateRoute(
        RouteSettings(name: Constants.ProfilePath, arguments: '1'),
      ),
    );
  }

  void _goToLeaderboard() {
    Navigator.push(
      context,
      Router.generateRoute(
        RouteSettings(name: Constants.LeaderboardPath),
      ),
    );
  }

  void _goToSettings() {
    Navigator.push(
      context,
      Router.generateRoute(
        RouteSettings(name: Constants.SettingsPath),
      ),
    );
  }
}
