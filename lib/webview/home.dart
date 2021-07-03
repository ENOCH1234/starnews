import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import '../drawer/drawer.dart';

class StarnewsHome extends StatefulWidget {
  const StarnewsHome({Key? key}) : super(key: key);
  @override
  _StarnewsHomeState createState() => _StarnewsHomeState();
}

class _StarnewsHomeState extends State<StarnewsHome> {
  final _flutterwebview = FlutterWebviewPlugin();
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
      ),

      drawer: MainDrawer(),

      body: Builder(builder: (BuildContext context) {
        return WebviewScaffold(
          url: 'https://www.starnews.com.ng',
          withZoom: true,
          scrollBar: true,
          withLocalStorage: true,
          withJavascript: true,
          initialChild: Center(child: Text('Loading...')),
        );
      }
      ),);
  }
  @override
  void dispose() {
    _flutterwebview.dispose();
    super.dispose();
  }
}