import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'webview/home.dart';
import 'webview/news.dart';
import 'webview/entertainment.dart';
import 'webview/politics.dart';
import 'webview/sports.dart';
import 'about.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    // to get size
    var size = MediaQuery.of(context).size;

    // style
    var cardTextStyle = TextStyle(
      fontFamily: 'Montserrat Regular',
      fontSize: 14,
      color: Color.fromRGBO(63, 63, 63, 1));

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .3,
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage('assets/images/top_header.png')
              )
            ),
          ),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 64,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundImage: NetworkImage('https://www.starnews.com.ng/wp-content/uploads/2021/03/starnews-favicon.png'),
                        ),
                        SizedBox(width: 16,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Welcome to Starnews',
                              style: TextStyle(fontFamily: 'Montserrat Medium',
                              color: Colors.white,
                              fontSize: 20),),
                            Text('Get Latest News and Updates',
                              style: TextStyle(fontSize: 14,
                              color: Colors.white,
                              fontFamily: 'Montserrat Medium'),)
                          ],
                        )
                      ],
                    ),
                  ),
                  
                  Expanded(
                    child: GridView.count(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        primary: false,
                        children: <Widget>[

                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => StarnewsHome()));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              elevation: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SvgPicture.asset(
                                    'https://image.flaticon.com/icons/svg/1904/1904425.svg',
                                    height: 112,),
                                  Text('Home', style: cardTextStyle,)
                                ],
                              ),
                            ),
                          ),

                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => StarnewsNews()));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                              ),
                              elevation: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SvgPicture.network(
                                    'https://image.flaticon.com/icons/svg/1904/1904425.svg',
                                    height: 112,),
                                  Text('News', style: cardTextStyle,)
                                ],
                              ),
                            ),
                          ),

                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => StarnewsPolitics()));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              elevation: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SvgPicture.network(
                                    'https://image.flaticon.com/icons/svg/1904/1904425.svg',
                                    height: 112,),
                                  Text('Politics', style: cardTextStyle,)
                                ],
                              ),
                            ),
                          ),

                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => StarnewsSports()));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              elevation: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SvgPicture.network(
                                    'https://image.flaticon.com/icons/svg/1904/1904425.svg',
                                    height: 112,),
                                  Text('Sports', style: cardTextStyle,)
                                ],
                              ),
                            ),
                          ),

                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => StarnewsEnt()));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              elevation: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SvgPicture.network(
                                    'https://image.flaticon.com/icons/svg/1904/1904425.svg',
                                    height: 112,),
                                  Text('Entertainment', style: cardTextStyle,)
                                ],
                              ),
                            ),
                          ),

                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => AboutApp()));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              elevation: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SvgPicture.network(
                                    'https://image.flaticon.com/icons/svg/1904/1904425.svg',
                                    height: 112,),
                                  Text('About App', style: cardTextStyle,)
                                ],
                              ),
                            ),
                          ),
                        ],
                        crossAxisCount: 2),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
