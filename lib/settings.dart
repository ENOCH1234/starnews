import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'drawer/drawer.dart';
import 'package:flutter/services.dart';
import 'webview/home.dart';
import 'package:starnews/admob_service.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  _AppSettingsState createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4f0034),
        brightness: Brightness.light, // status bar brightness
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.black12),
        title: Text('Settings',
          style: TextStyle(
              fontFamily: "Montserrat Medium"
          ),),
        centerTitle: true,
        elevation: 0,

        // Home Button
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            tooltip: 'Home',
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => StarnewsHome())
              );
            },
          ),
        ],
      ),

      drawer: MainDrawer(),

      body: Container(
        child: Text(
          'Settings Page Loading...'
        ),
    ),

      bottomNavigationBar: Container(
        height: 50,
        child: AdWidget(
          key: UniqueKey(),
          ad: AdMobService.createBannerAd()..load(),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
