import 'package:flutter/material.dart';
import 'package:starnews/utils/user_preferences.dart';
import 'package:starnews/widget/button_widget.dart';
import 'package:starnews/widget/numbers_widget.dart';
import 'package:starnews/widget/profile_widget.dart';
import 'model/user.dart';
import 'webview/home.dart';
import 'drawer/drawer.dart';
import 'package:flutter/services.dart';
import 'package:starnews/admob_service.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutApp extends StatefulWidget {
  static String routeName = AboutApp() as String;

  const AboutApp({Key? key}) : super(key: key);

  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4f0034),
        brightness: Brightness.light,
        // status bar brightness
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.black12),
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
                  context,
                  MaterialPageRoute(builder: (context) => StarnewsHome())
              );
            },
          ),
        ],
      ),

      //  Drawer
      drawer: MainDrawer(),

      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          Center(child: buildUpgradeButton()),
          const SizedBox(height: 24),
          NumbersWidget(),
          const SizedBox(height: 48),
          buildAbout(user),
        ],
      ),

      bottomNavigationBar: Container(
        height: 50,
        child: AdWidget(
          key: UniqueKey(),
          ad: AdMobService.createBannerAd()
            ..load(),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget buildName(User user) =>
      Column(
        children: [
          Text(
            user.name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: "Montserrat Medium",
            ),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: "Montserrat Regular",
            ),
          ),
        ],
      );

  Widget buildUpgradeButton() =>
      ButtonWidget(
        text: '🌐 Visit Web Portal',
        onClicked: _launchWebPortal,
      );

  buildAbout(User user) =>
      Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(
                color: Color(0xff4f0034),
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: "Montserrat Medium",
              ),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 16,
                height: 1.4,
                fontFamily: "Montserrat Regular",
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 30),
          ],
        ),
      );
}

void _launchWebPortal() async {
  const url = 'https://starnews.com.ng';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}