import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
// import 'dart:html';
import 'package:flutter/services.dart';
import 'package:starnews/admob_service.dart';
import '../drawer/drawer.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StarnewsHome extends StatefulWidget {
  const StarnewsHome({Key? key}) : super(key: key);
  @override
  _StarnewsHomeState createState() => _StarnewsHomeState();
}

class _StarnewsHomeState extends State<StarnewsHome> {
  // final _flutterwebview = FlutterWebviewPlugin();

  // void _refreshAction() {
  //   setState(() {
  //     _response = http.read(dadJokeApi, headers: httpHeaders);
  //   });
  // }

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
        title: Text('Starnews',
          style: TextStyle(
              fontFamily: "Montserrat Medium"
          ),),
        centerTitle: true,
        elevation: 0,
        //Refresh button
        // actions: [
        //   IconButton(
        //       onPressed: () => {},
        //       icon: Icon(Icons.refresh))
        // ],
      ),

      drawer: MainDrawer(),
      // key.openEndDrawer(),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'https://starnews.com.ng',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          onProgress: (int progress) {
            print("WebView is loading (progress : $progress%)");
          },
          javascriptChannels: <JavascriptChannel>{
            _toasterJavascriptChannel(context),
          },
          navigationDelegate: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              print('blocking navigation to $request}');
              return NavigationDecision.prevent;
            }
            print('allowing navigation to $request');
            return NavigationDecision.navigate;
          },
          onPageStarted: (String url) {
            print('Page started loading: $url');
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
          gestureNavigationEnabled: true,
        );
      }),

      // body: Builder(builder: (BuildContext context) {
      //   return WebviewScaffold(
      //     url: 'https://www.starnews.com.ng',
      //     withZoom: true,
      //     scrollBar: true,
      //     withLocalStorage: true,
      //     withJavascript: true,
      //     initialChild: Center(child: Text('Loading...')),
      //   );
      // }
      // ),

      // body: new RefreshIndicator(
      //     child: new Center(
      //       child: Text('Welcome!'),
      //     ),
      //     onRefresh: () async {},
      // ),

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
  // @override
  // void dispose() {
  //   _flutterwebview.dispose();
  //   super.dispose();
  // }
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