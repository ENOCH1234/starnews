import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../about.dart';
import '../webview/entertainment.dart';
import '../webview/home.dart';
import '../webview/news.dart';
import '../webview/politics.dart';
import '../webview/sports.dart';
import '../settings.dart';
import '../test_notification.dart';


class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Color(0xff4f0034),
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 30,
                      bottom: 10
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://www.starnews.com.ng/wp-content/uploads/2021/03/starnews-favicon.png"
                        ),
                        fit: BoxFit.fill
                      ),
                    ),
                  ),
                  Text("Starnews",
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontFamily: 'Montserrat Medium',
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  Text("Get Latest News",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat Regular',
                    ),
                  ),
                ],
              )
            ),
          ),

          // Home
          ListTile(
            leading: Icon(Icons.home, color: Color(0xff4f0034),),
            title: Text("Home",
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Montserrat Medium',
                fontWeight: FontWeight.w700
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => StarnewsHome())
              );
            },
          ),

          // News
          ListTile(
            leading: Icon(Icons.web, color: Color(0xff4f0034),),
            title: Text("News",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat Medium',
                  fontWeight: FontWeight.w700
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => StarnewsNews())
              );
            },
          ),

          // Politics
          ListTile(
            leading: Icon(Icons.people_outline_outlined, color: Color(0xff4f0034),),
            title: Text("Politics",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat Medium',
                  fontWeight: FontWeight.w700
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => StarnewsPolitics())
              );
            },
          ),


          // Sport News
          ListTile(
            leading: Icon(Icons.sports, color: Color(0xff4f0034),),
            title: Text("Sport News",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat Medium',
                  fontWeight: FontWeight.w700
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => StarnewsSports())
              );
            },
          ),

          // Entertainment
          ListTile(
            leading: Icon(Icons.celebration, color: Color(0xff4f0034),),
            title: Text("Entertainment",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat Medium',
                  fontWeight: FontWeight.w700
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => StarnewsEnt())
              );
            },
          ),

          // Settings
          ListTile(
            leading: Icon(Icons.settings, color: Color(0xff4f0034),),
            title: Text("Settings",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat Medium',
                  fontWeight: FontWeight.w700
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AppSettings())
              );
            },
          ),

          // Test Notification
          ListTile(
            leading: Icon(Icons.notifications, color: Color(0xff4f0034),),
            title: Text("Test Notification",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat Medium',
                  fontWeight: FontWeight.w700
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp())
              );
            },
          ),

          // About App
          ListTile(
            leading: Icon(Icons.info, color: Color(0xff4f0034),),
            title: Text("About App",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat Medium',
                  fontWeight: FontWeight.w700
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AboutApp())
              );
            },
          ),
        ],
      ),
    );
  }
}
