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
  bool valNotify1 = true;
  bool valNotify2 = false;
  bool valNotify3 = false;

  late bool newValue1;
  late bool newValue2;
  late bool newValue3;

  onChangeFunction1(bool newValue) {
    setState(() {
      valNotify1 = newValue1;
    });
  }

  onChangeFunction2(bool newValue) {
    setState(() {
      valNotify2 = newValue2;
    });
  }

  onChangeFunction3(bool newValue) {
    setState(() {
      valNotify3 = newValue3;
    });
  }

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
        // child: Text(
        //   'Settings Page Loading...',
        //   textAlign: TextAlign.center,
        padding: const EdgeInsets.all(10),
        child: ListView(
        children: [
          SizedBox(height: 40),
          Row(
            children: [
              Icon(
              Icons.person,
              color: Color(0xff4f0034),
            ),
          SizedBox(width: 10,),
          Text("App",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Montserrat Medium",
              fontWeight: FontWeight.bold,
              color: Color(0xff4f0034),
             ),),
            ]
          ),
          Divider(height: 20, thickness: 1),
          SizedBox(height: 10),
          buildAccountOption(context, "App Version"),
          buildAccountOption(context, "About App Owner"),
          buildAccountOption(context, "About Developer"),
          buildAccountOption(context, "Disclaimer"),
          SizedBox(height: 40),
          Row(
            children: [
              Icon(Icons.volume_up_outlined, color: Color(0xff4f0034)),
              SizedBox(width: 10),
              Text("Notifications", style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Montserrat Medium",
                color: Color(0xff4f0034),
              ))
            ],
          ),
          Divider(height: 20, thickness: 1),
          SizedBox(height: 10),
          buildNotificationOption("News Updates", valNotify1, onChangeFunction1),
          buildNotificationOption("Safe Cache", valNotify2, onChangeFunction2),
          SizedBox(height: 50),
          Center(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shadowColor: Color(0xFF4F0034),
                padding: const EdgeInsets.symmetric(horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: ()=> SystemNavigator.pop(),
              child: Text("Exit App",
                style: TextStyle(
                  fontFamily: "Montserrat Medium",
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  letterSpacing: 2.2,
                  color: Color(0xFF4F0034)
                ),), // To be changed
            ),
          )
        ],
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

  Padding buildNotificationOption(String title, bool value, Function onChangeMethod) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Colors.grey[600],
            fontFamily: "Montserrat Regular"
          ),),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: Color(0xff4f0034),
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue) {
                onChangeMethod(newValue);
              },
            ),
          )
        ],
      ),
    );
  }

  GestureDetector buildAccountOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Option 1"),
                Text("Option 2")
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                child: Text("Okay",
                  style: TextStyle(
                      fontFamily: "Montserrat Medium",
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Color(0xFF4F0034)
                  ),), // To be changed
              ),
            ],
          );
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.grey[600],
              fontFamily: "Montserrat Regular",
            ),),
            Icon(Icons.arrow_forward_ios, color: Colors. grey,)
          ],

        ),
      ),
    );
  }
}
