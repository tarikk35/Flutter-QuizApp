import 'package:carousel_slider/carousel_slider.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:quiz_app/configs/constants.dart';
import 'package:quiz_app/configs/default_sizes.dart';
import 'package:quiz_app/router.dart';
import 'package:quiz_app/viewmodels/settings_viewmodel.dart';
import 'package:quiz_app/widgets/back_icon.dart';
import 'package:quiz_app/widgets/gradient_bg.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingsPageState();
  }
}

class _SettingsPageState extends State<SettingsPage> {
  List<FlareActor> _images;
  int currIndex = 0;
  int initialIndex = 0;
  final sizes = DefaultSizes();
  final provider = SettingsModel();
  @override
  void initState() {
    super.initState();
    _images = List.generate(
        14, (index) => FlareActor('images/icons/icon (${index + 1}).flr'));
  }

  void logout() async {
    if (await provider.logout()) {
      Navigator.pushAndRemoveUntil(
        context,
        Router.generateRoute(RouteSettings(name: Constants.LoginPath)),
        (Route<dynamic> route) => false,
      );
    } else {
    }
  }

  void getPage() async {
    initialIndex = int.parse(await provider.getIconFromPrefs() ?? '1');
    --initialIndex;
  }

  void _showExitDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure you want to quit ?'),
        actions: <Widget>[
          RaisedButton(
            child: Text('NO'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          RaisedButton(
            child: Text('YES'),
            onPressed: logout,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    getPage();
    return Scaffold(
      body: GradientBackground(
        first: Color(0xffb4a48e),
        second: Color(0xff76695b),
        child: SafeArea(
          child: _buildPageLayout(),
        ),
      ),
    );
  }

  Widget _buildPageLayout() {
    provider.getIconFromPrefs();
    return Observer(
      builder: (context) => provider.busy
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                _buildAppbar(),
                _buildIconCarousel(),
                _buildSaveButton(),
                _buildCredits()
              ],
            ),
    );
  }

  Widget _buildAppbar() {
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: sizes.minPaddingW2),
            child: BackIcon(
              color: Colors.white70,
              onTapFunc: () => Navigator.pop(context),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(Icons.exit_to_app),
              iconSize: sizes.minPaddingW1 * 2,
              onPressed: _showExitDialog,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton() {
    return Expanded(
      flex: 2,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onPressed: () {
          provider.setIconToPrefs((currIndex + 1).toString());
        },
        child: provider.busy ? CircularProgressIndicator() : Text('SELECT'),
      ),
    );
  }

  Widget _buildIconCarousel() {
    return Expanded(
      flex: 6,
      child: CarouselSlider(
        items: List.generate(
          _images.length,
          (index) => Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(sizes.minPaddingW1),
              padding: EdgeInsets.all(sizes.minPaddingW1),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: provider.selectedIcon == index + 1
                      ? Colors.green
                      : Colors.grey.shade300),
              child: _images[index]),
        ),
        autoPlay: false,
        initialPage: initialIndex,
        scrollDirection: Axis.horizontal,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        viewportFraction: 0.5,
        onPageChanged: (index) {
          currIndex = (initialIndex + index) % _images.length;
        },
      ),
    );
  }

  Widget _buildCredits() {
    return Expanded(
      flex: 6,
      child: Container(),
    );
  }
}
