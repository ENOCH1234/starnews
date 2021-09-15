import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import '../drawer/drawer.dart';
import 'package:starnews/settings.dart';
import 'package:flutter/services.dart';
import 'package:starnews/admob_service.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import '../api/notification_api.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class StarnewsHome extends StatefulWidget {
  const StarnewsHome({Key? key}) : super(key: key);
  @override
  _StarnewsHomeState createState() => _StarnewsHomeState();
}

class _StarnewsHomeState extends State<StarnewsHome> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  // bool isLoading=true;
  // final _key = UniqueKey();
  final Completer<WebViewController> _controller = Completer<WebViewController>();


  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = new IOSInitializationSettings();
    var initSetttings = new InitializationSettings(android: android, iOS: iOS);
    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  Future onSelectNotification(String? payload) async {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return StarnewsHome();
    }));
    // debugPrint("payload : $payload");
    //
    // showDialog(
    //     context: context,
    //     builder: (_) =>  StarnewsHome()// put new link here
      // new AlertDialog(
      //   title: new Text('Notification'),
      //   content: new Text('$payload'),
      // ),
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4f0034),
        brightness: Brightness.light, // status bar brightness
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.black12),
        title: Text('Starnews',
          style: TextStyle(
              fontFamily: "Montserrat Medium"
          ),),
        centerTitle: true,
        elevation: 0,

        // Notification Button
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            tooltip: 'Notification Settings',
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AppSettings())
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            tooltip: 'Notification',
            onPressed: () => showNotification()
          ),
        ],
      ),

      drawer: MainDrawer(),

      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'https://starnews.com.ng',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          javascriptChannels: <JavascriptChannel>{
            _toasterJavascriptChannel(context),
          },
          gestureNavigationEnabled: true,
        );
      }),

      // body: Stack(
      //   children: <Widget>[
      //     WebView(
      //       key: _key,
      //       initialUrl: 'https://starnews.com.ng',
      //       javascriptMode: JavascriptMode.unrestricted,
      //       onPageFinished: (finish) {
      //         setState(() {
      //           isLoading = false;
      //         });
      //       },
      //     ),
      //     isLoading ? Center( child: CircularProgressIndicator(),)
      //         : Stack(),
      //   ],
      // ),

      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          backgroundColor: Color(0xff4f0034),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StarnewsHome()),
            );
          }),

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

  showNotification() async {
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.high,importance: Importance.max
    );
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.show(
        0, 'Read Amazing News', 'Read latest news updates on the Starnews app, specially curated for you!', platform,
        payload: 'Starnews');
  }

}

JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
  return JavascriptChannel(
      name: 'Toaster',
      onMessageReceived: (JavascriptMessage message) {
        // ignore: deprecated_member_use
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text(message.message)),
        );
      });
}
