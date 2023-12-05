import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:youtube/VideoPlayer.dart';

class Trending extends StatefulWidget {
  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {

  final String url = "http://userapi.tk/youtube/";
  bool isLoading = true;
  var data;


  @override
  void initState() {
    super.initState();
    this.getjsondata();
  }


  Future<String> getjsondata() async {
    var responce = await http.get(Uri.encodeFull(url));
    setState(() {
      var convertdatatojson = json.decode(responce.body);
      data = convertdatatojson;
      isLoading = false;
    });
  }


  playVideo(String vurl) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => VideoApp(url: vurl)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 110,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
//********************** Music ****************************
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 15, 10, 7),
                    child: InkResponse(
                      child: Image.asset(
                        "assets/images/music.png",
                        height: 60,
                      ),
                      onTap: () {},
                      containedInkWell: false,
                      radius: 45,
                    ),
                  ),
                  Container(
                    child: Text(
                      "Music",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ],
              ),

//******************** Gaming ****************************
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 10, 7),
                    child: InkResponse(
                      child: Image.asset(
                        "assets/images/game.png",
                        height: 60,
                      ),
                      onTap: () {},
                      containedInkWell: false,
                      radius: 45,
                    ),
                  ),
                  Container(
                    child: Text(
                      "Gaming",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),

//******************* News ****************************
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 10, 7),
                    child: InkResponse(
                      child: Image.asset(
                        "assets/images/news.png",
                        height: 60,
                      ),
                      onTap: () {},
                      containedInkWell: false,
                      radius: 45,
                    ),
                  ),
                  Container(
                    child: Text(
                      "News",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),

//******************* Movies ****************************
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 10, 7),
                    child: InkResponse(
                      child: Image.asset(
                        "assets/images/movies.png",
                        height: 60,
                      ),
                      onTap: () {},
                      containedInkWell: false,
                      radius: 45,
                    ),
                  ),
                  Container(
                    child: Text(
                      "Movies",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),

//******************* Fashion ****************************
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 10, 7),
                    child: InkResponse(
                      child: Image.asset(
                        "assets/images/fashion.png",
                        height: 60,
                      ),
                      onTap: () {},
                      containedInkWell: false,
                      radius: 45,
                    ),
                  ),

                  Container(
                    child: Text(
                      "Fashion",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        Expanded(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: isLoading
                  ? CircularProgressIndicator()
                  : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) =>
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => playVideo(data[index]['VideoURL']),
                          child: SizedBox(
                            child: Image.network(
                              data[index]["ThumbmnilURL"],
                              fit: BoxFit.cover,
                            ),
                            width: double.infinity,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(12, 12, 16, 15),
                              child: CircleAvatar(
                                backgroundImage:
                                NetworkImage(data[index]["ProfileiconURL"]),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    data[index]["Title"],
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 3),
                                    child: Text(
                                      data[index]["Name"] +
                                          " " +
                                          data[index]["Views"] +
                                          " views " +
                                          data[index]["Day"],
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.more_vert),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
