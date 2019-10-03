import 'package:flare_flutter/flare_cache.dart';
import 'package:flare_flutter/flare_cache_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/router.dart';
import 'package:quiz_app/services/login_service.dart';
import 'configs/constants.dart';

bool logged = false;

void main() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  logged = await LoginService().autoLogin();
  FlareCache.doesPrune = false;
  Iterable<String> assets =
      [...List.generate(6, (index) => 'images/categories/category${index + 1}.flr'),'images/app_icon.flr'];
  Iterable<Future<FlareCacheAsset>> futures =
      assets.map((String asset) => cachedActor(rootBundle, asset));
  await Future.wait(futures);
  runApp(MyApp());
}
// TODO > Profile ekranındaki kartların infoları ayar gerek.
// TODO > Endscreen ekranı ve simple anti-cheat
// (eğer doğruyanlış sayısı soru sayısından fazlaysa 0 gönder ve maksimum puanı kontrol et.)

// TODO > Login/Logouttan sonra olurken token ile beraber usericon'u da al.
// TODO > Profile Kategoride kaç soru çözdüğünü API'dan iste.

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Montserrat', brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      initialRoute: logged
          ? Constants.OpeningPath
          : Constants.LoginPath,
      onGenerateRoute: Router.generateRoute,
    );
  }
}