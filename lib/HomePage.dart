import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youtube/Home.dart';
import 'package:youtube/Inbox.dart';
import 'package:youtube/Library.dart';
import 'package:youtube/Subscriptions.dart';
import 'package:youtube/Trending.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pageList = [
    Home(),
    Trending(),
    Subscriptions(),
    Inbox(),
    Library(),
  ];

  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff282828),
        title: Image.asset(
          "assets/images/logo.jpg",
          width: 105,
        ),

//******************* Actions ***************************
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 5),
            child: IconButton(
              icon: Icon(Icons.videocam),
              color: Colors.white,
              onPressed: (){},
            ),
          ),
          
          Container(
            margin: EdgeInsets.only(right: 5),
            child: IconButton(
              icon: Icon(Icons.search),
              color: Colors.white,
              onPressed: (){},
            ),
          ),
          IconButton(
            icon: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://scontent-sin2-2.xx.fbcdn.net/v/t1.0-1/p160x160/64340449_2337463323244547_2174759606612393984_n.jpg?_nc_cat=109&_nc_oc=AQl0XB7iywuWGHilz6fQBJsHQ6RYjDZH0AETIKL18aBs27d7duLq6bpYvCief81JP8I&_nc_ht=scontent-sin2-2.xx&oh=e14dcec173375fa651a2d1af2c4c279c&oe=5E2BFADD",
              ),
              radius: 13,
            ),
            onPressed: () {},
          ),
        ],
      ),

      body: pageList[myIndex],

//****************** Bottom Navigation Bar **************************
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Color(0xff909090),
        selectedItemColor: Colors.white,
        iconSize: 20,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        currentIndex: myIndex,
        onTap: (int currentIndex) {
          setState(() {
            myIndex = currentIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Container(
              margin: EdgeInsets.only(top: 4),
              child: Text("Home"),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.fire),
            title: Container(
              margin: EdgeInsets.only(top: 4),
              child: Text("Trending"),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            title: Container(
              margin: EdgeInsets.only(top: 4),
              child: Text("Subscriptions"),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.solidEnvelope),
            title: Container(
              margin: EdgeInsets.only(top: 4),
              child: Text("Inbox"),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.solidFolder),
            title: Container(
              margin: EdgeInsets.only(top: 4),
              child: Text("Library"),
            ),
          ),
        ],
      ),
    );
  }
}
