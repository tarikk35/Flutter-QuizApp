import 'package:auto_size_text/auto_size_text.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/configs/constants.dart';
import 'package:quiz_app/configs/default_sizes.dart';
import 'package:quiz_app/router.dart';
import 'package:quiz_app/viewmodels/login_viewmodel.dart';
import 'package:quiz_app/widgets/gradient_bg.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  DefaultSizes sizes;
  LoginViewModel provider;
  AnimationController fbButtonAnimController;
  AnimationController googleButtonAnimController;
  Animation fbButtonSqueezeAnim;
  Animation googleButtonSqueezeAnim;
  bool isClicked = false;

  @override
  void initState() {
    super.initState();
    provider = LoginViewModel();
    fbButtonAnimController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    googleButtonAnimController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    fbButtonSqueezeAnim = Tween<double>(begin: 400.0, end: 54.0).animate(
        (CurvedAnimation(
            parent: fbButtonAnimController, curve: Curves.bounceIn)));

    googleButtonSqueezeAnim = Tween<double>(begin: 400.0, end: 54.0).animate(
        (CurvedAnimation(
            parent: googleButtonAnimController, curve: Curves.bounceIn)));

    sizes = DefaultSizes();
  }

  @override
  Widget build(BuildContext context) {
    sizes.getContext(context);
    return WillPopScope(
      child: SafeArea(
        child: Scaffold(
          body: GradientBackground(
            first: Color(0xff556589),
            second: Color(0xff16694a),
            child: Stack(
              children: <Widget>[
                _buildLoginButtons(),
                _buildAppIcon(),
                _buildAppName(),
              ],
            ),
          ),
        ),
      ),
      onWillPop: () async => false, // dialog yapılabilir
    );
  }

  void _facebookLogin() async {
    fbButtonAnimController.forward();
    isClicked = true;
    if (await provider.loginWithFacebook())
      _openGame();
    else {
      fbButtonAnimController.reverse();
      setState(() {
        isClicked = false;
      });
    }
  }

  void _googleLogin() async {
    googleButtonAnimController.forward();
    isClicked = true;
    if (await provider.loginWithGoogle())
      _openGame();
    else {
      googleButtonAnimController.reverse();
      setState(() {
        isClicked = false;
      });
    }
  }

  void _openGame() {
    Navigator.pushAndRemoveUntil(
      context,
      Router.generateRoute(
        RouteSettings(
          name: Constants.OpeningPath,
        ),
      ),
      (Route<dynamic> route) => false,
    );
  }

  Widget _buildLoginButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        _buildSocialButton(
            color: Color(0xff3C5B9B),
            iconPath: 'images/face.png',
            text: 'Connect with Facebook',
            textColor: Colors.white,
            onPressed: _facebookLogin,
            animation: fbButtonSqueezeAnim,
            iconMargin: 12.0),
        _buildSocialButton(
            color: Colors.white,
            iconPath: 'images/google.png',
            text: ' ‏‏‎ Sign in with Google ‏‏‎ ',
            textColor: Colors.black,
            onPressed: _googleLogin,
            animation: googleButtonSqueezeAnim,
            iconMargin: 12.0),
      ],
    );
  }

  Widget _buildAppIcon() {
    return Positioned(
      top: sizes.deviceSize.height / 10,
      bottom: sizes.deviceSize.height / 2.2,
      left: 0,
      right: 0,
      child: Container(
        child: FlareActor('images/app_icon.flr'),
      ),
    );
  }

  Widget _buildAppName() {
    return Positioned(
      top: sizes.deviceSize.height / 1.8,
      left: sizes.minPaddingW1 * 3,
      right: sizes.minPaddingW1 * 3,
      child: AutoSizeText(
        'Quiz Application',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 40),
        maxLines: 1,
      ),
    );
  }

  Widget _buildSocialButton(
      {color,
      iconPath,
      text,
      textColor,
      iconMargin,
      onPressed,
      Animation animation}) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => Container(
        height: sizes.minPaddingH1 * 3,
        width: animation.value,
        margin: EdgeInsets.only(
            bottom: sizes.minPaddingH1,
            left: sizes.minPaddingW1 * 4,
            right: sizes.minPaddingW1 * 4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadiusDirectional.circular(sizes.minPaddingW2),
        ),
        child: InkWell(
          onTap: !isClicked ? onPressed : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: sizes.minPaddingW1,
                height: sizes.minPaddingW1,
                child: animation.value < 300
                    ? CircularProgressIndicator()
                    : SizedBox(
                        child: Image(
                          image: AssetImage(iconPath),
                        ),
                      ),
              ),
              animation.value < 300
                  ? Container()
                  : AutoSizeText(
                      text,
                      style: TextStyle(color: textColor),
                      maxLines: 1,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    fbButtonAnimController.dispose();
    googleButtonAnimController.dispose();
    super.dispose();
  }
}
