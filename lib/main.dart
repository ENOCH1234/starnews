import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'webview/home.dart';
import 'data/data.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var slides = <SliderModel>[];
  int currentIndex = 0;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides = getSlides();
  }

  Widget pageIndexIndicator(bool isCurrentPage){
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
    return Scaffold(
      body: PageView.builder(
          itemCount: slides.length,
          onPageChanged: (val){
            setState(() {
              currentIndex = val;
            });
          },
          itemBuilder: (context, index){
            return SliderTile(
              imageAssetPath: slides[index].getImageAssetPath(),
              title: slides[index].getTitle(),
              desc: slides[index].getDesc(),
            );
          }
          ),

      bottomSheet: currentIndex != slides.length - 1 ? Container(
        height: Platform.isIOS ? 70 : 60,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {},
              child:Text("SKIP")
            ),
            Row(
              children: [
                for(int i = 0; i < slides.length; i++) currentIndex == i ?pageIndexIndicator(true) : pageIndexIndicator(false)
              ],
            ),
            GestureDetector(
              onTap: () {},
              child:Text("NEXT")
            ),
          ],
        ),
      ): Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: Platform.isIOS ? 70 : 60,
        color: Colors.blue,
        child: Text("GET STARTED NOW", style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600
    ),),
      ),
    );
  }
}

class SliderTile extends StatelessWidget {

  String imageAssetPath, title, desc;
  SliderTile({required this.imageAssetPath, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageAssetPath),
          SizedBox(height: 20,),
          Text(title),
          SizedBox(height: 12,),
          Text(desc),

        ],
      ),
    );
  }
}