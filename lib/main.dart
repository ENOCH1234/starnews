// @dart=2.9

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'webview/home.dart';
import 'package:splashscreen/splashscreen.dart';
import 'data/data.dart';

void main() {
  runApp(Onboarding());
}

class myApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 15,
      backgroundColor: Color(0xff4f0034),
      image: Image.asset("assets/images/logo.gif"),
      loaderColor: Colors.white,
      photoSize: 150.0,
      navigateAfterSeconds: Onboarding(),
    );
  }
}

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var slides = <SliderModel>[];
  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides = getSlides();
  }

  Widget pageIndexIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/onboarding/purple_bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: PageView.builder(
            controller: pageController,
            itemCount: slides.length,
            onPageChanged: (val) {
              setState(() {
                currentIndex = val;
              });
            },
            itemBuilder: (context, index) {
              return SliderTile(
                imageAssetPath: slides[index].getImageAssetPath(),
                title: slides[index].getTitle(),
                desc: slides[index].getDesc(),
              );
            }),
        bottomSheet: currentIndex != slides.length - 1
            ? Container(
                height: Platform.isIOS ? 70 : 60,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          pageController.animateToPage(slides.length - 1,
                              duration: Duration(milliseconds: 400),
                              curve: Curves.linear);
                        },
                        child: Text(
                          "SKIP",
                          style: TextStyle(
                            fontFamily: "Montserrat Medium",
                            color: Colors.purple,
                          ),
                        )),
                    Row(
                      children: [
                        for (int i = 0; i < slides.length; i++)
                          currentIndex == i
                              ? pageIndexIndicator(true)
                              : pageIndexIndicator(false)
                      ],
                    ),
                    GestureDetector(
                        onTap: () {
                          pageController.animateToPage(currentIndex + 1,
                              duration: Duration(milliseconds: 400),
                              curve: Curves.linear);
                        },
                        child: Text(
                          "NEXT",
                          style: TextStyle(
                            fontFamily: "Montserrat Medium",
                            fontWeight: FontWeight.w700,
                            color: Color(0xff4f0034),
                          ),
                        )),
                  ],
                ),
              )
            : Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: Platform.isIOS ? 70 : 60,
                color: Color(0xff4f0034),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => StarnewsHome()));
                  },
                  child: Text(
                    "GET STARTED NOW",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Montserrat Medium",
                    ),
                  ),
                ),
              ),
      ),
    ]);
  }
}

class SliderTile extends StatelessWidget {
  String imageAssetPath, title, desc;
  SliderTile({this.imageAssetPath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageAssetPath),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              fontFamily: "Montserrat Medium",
              color: Color(0xff4f0034),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16,
              fontFamily: "Montserrat Regular",
            ),
          ),
        ],
      ),
    );
  }
}