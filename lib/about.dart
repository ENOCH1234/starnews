import 'package:flutter/material.dart';
import 'webview/home.dart';
import 'drawer/drawer.dart';
import 'package:flutter/services.dart';
import 'package:starnews/admob_service.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AboutApp extends StatefulWidget {
  static String routeName = AboutApp() as String;

  const AboutApp({Key? key}) : super(key: key);

  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4f0034),
        brightness: Brightness.light, // status bar brightness
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.black12),
        title: Text('About App',
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

    //  Drawer
      drawer: MainDrawer(),

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