import 'package:flutter/material.dart';
import 'drawer/drawer.dart';

class Screen extends StatelessWidget {
  const ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Menu")
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [

],
),
      ),
    );
  }
}
