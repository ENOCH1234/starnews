import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:starnews/admob_service.dart';
import '../drawer/drawer.dart';
import 'package:starnews/settings.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StarnewsSports extends StatefulWidget {
  const StarnewsSports({Key? key}) : super(key: key);
  @override
  _StarnewsSportsState createState() => _StarnewsSportsState();
}

class _StarnewsSportsState extends State<StarnewsSports> {
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
        title: Text('Sports',
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
          initialUrl: 'https://starnews.com.ng/category/sports/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          javascriptChannels: <JavascriptChannel>{
            _toasterJavascriptChannel(context),
          },
          gestureNavigationEnabled: true,
          // javascriptMode: JavascriptMode.unrestricted,
          // onWebViewCreated: (WebViewController webViewController) {
          //   _controller.complete(webViewController);
          // },
          // onProgress: (int progress) {
          //   print("Loading (progress : $progress%)");
          // },
          // javascriptChannels: <JavascriptChannel>{
          //   _toasterJavascriptChannel(context),
          // },
          // navigationDelegate: (NavigationRequest request) {
          //   if (request.url.startsWith('https://www.starnews.com.ng/category/sports/')) {
          //     print('blocking navigation to $request}');
          //     // return NavigationDecision.prevent;
          //   }
          //   print('allowing navigation to $request');
          //   return NavigationDecision.navigate;
          // },
          // onPageStarted: (String url) {
          //   print('Page started loading: $url');
          // },
          // onPageFinished: (String url) {
          //   print('Page finished loading: $url');
          // },
          // gestureNavigationEnabled: true,
        );
      }),

      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          backgroundColor: Color(0xff4f0034),
          tooltip: 'Refresh',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StarnewsSports()),
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