import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  final String text;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context) => ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        onPrimary: Colors.white,
        primary: Color(0xff4f0034),
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 12),
      ),
      onPressed: _launchWebPortal,
      child: Text(text, style: TextStyle(
        fontFamily: "Montserrat Medium",
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0,
      ),),
  );
}

_launchWebPortal() async {
  const url = 'https://starnews.com.ng';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}