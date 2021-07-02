import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class StarnewsEnt extends StatefulWidget {
  const StarnewsEnt({Key? key}) : super(key: key);
  @override
  _StarnewsEntState createState() => _StarnewsEntState();
}

class _StarnewsEntState extends State<StarnewsEnt> {
  final _flutterwebview = FlutterWebviewPlugin();
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'https://www.starnews.com.ng/category/entertainment/',
      appBar: AppBar(
        backgroundColor: Color(0xff4f0034),
        brightness: Brightness.light, // status bar brightness
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white10),
        title: Text('Starnews - Entertainment'),
        centerTitle: true,
        elevation: 0,
      ),
      withZoom: true,
      scrollBar: true,
      withLocalStorage: true,
      withJavascript: true,
      initialChild: Center (child: Text('Loading...')),
      // bottomNavigationBar: Padding(
      //   padding: EdgeInsets.all(12),
      //   child: Text('Bottom Navigation'),
      // ),
    );
  }
  @override
  void dispose() {
    _flutterwebview.dispose();
    super.dispose();
  }
}