import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'about.dart';

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
            color: Theme.of(context).primaryColor,
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
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),

                  Text("Get Latest News",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: null,
          ),

          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: null,
          ),

          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text("About App",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(AboutApp.routeName);
            },
          ),
        ],
      ),
    );
  }
}
