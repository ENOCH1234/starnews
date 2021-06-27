import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class StarnewsSports extends StatefulWidget {
  const StarnewsSports({Key? key}) : super(key: key);
  @override
  _StarnewsSportsState createState() => _StarnewsSportsState();
}

class _StarnewsSportsState extends State<StarnewsSports> {
  final _flutterwebview = FlutterWebviewPlugin();
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'https://www.starnews.com.ng/category/sports/',
      appBar: AppBar(
        backgroundColor: Color(0xff4f0034),
        title: Text('Starnews - Sports'),
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