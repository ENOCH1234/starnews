import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:starnews/admob_service.dart';
import '../drawer/drawer.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:starnews/settings.dart';

class StarnewsEnt extends StatefulWidget {
  const StarnewsEnt({Key? key}) : super(key: key);
  @override
  _StarnewsEntState createState() => _StarnewsEntState();
}

class _StarnewsEntState extends State<StarnewsEnt> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4f0034),
        brightness: Brightness.light, // status bar brightness
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.black12),
        title: Text('Entertainment',
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
        ],
      ),

      drawer: MainDrawer(),
      // key.openEndDrawer(),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'https://starnews.com.ng/category/entertainment/',
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

      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          backgroundColor: Color(0xff4f0034),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StarnewsEnt()),
            );
          }),

      bottomNavigationBar: Container(
        height: 70,
        child: AdWidget(
          key: UniqueKey(),
          ad: AdMobService.createBannerAd()..load(),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
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