import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:youtube/VideoPlayer.dart';

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  final String url = "http://userapi.tk/youtube/";
  bool isLoading = true;
  var data;

  @override
  void initState() {
    super.initState();
    this.getjsondata();
  }

  Future<String> getjsondata() async {
    var response = await http.get(Uri.encodeFull(url));
    setState(() {
      var convertjsontodata = json.decode(response.body);
      data = convertjsontodata;
      isLoading = false;
    });
  }

  playVideo(String vurl) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => VideoApp(url: vurl)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 14, 0, 5),
                    child: Text(
                      "Recent",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 125,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        InkWell(
                          onTap: () => playVideo(data[0]["VideoURL"]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                height: 85,
                                width: 120,
                                child: Image.network(
                                  data[0]["ThumbmnilURL"],
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.fromLTRB(18, 0, 0, 0),
                                    width: 90,
                                    child: Text(
                                      data[0]["Title"],
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(18, 0, 0, 10),
                                    child: InkResponse(
                                      child: Icon(
                                        Icons.more_vert,
                                        size: 16,
                                        color: Colors.grey,
                                      ),
                                      onTap: () {},
                                      radius: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () => playVideo(data[1]["VideoURL"]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                height: 85,
                                width: 120,
                                child: Image.network(
                                  data[1]["ThumbmnilURL"],
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.fromLTRB(18, 0, 0, 0),
                                    width: 90,
                                    child: Text(
                                      data[1]["Title"],
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(18, 0, 0, 10),
                                    child: InkResponse(
                                      child: Icon(
                                        Icons.more_vert,
                                        size: 16,
                                        color: Colors.grey,
                                      ),
                                      onTap: () {},
                                      radius: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () => playVideo(data[2]["VideoURL"]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                height: 85,
                                width: 120,
                                child: Image.network(
                                  data[2]["ThumbmnilURL"],
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.fromLTRB(18, 0, 0, 0),
                                    width: 90,
                                    child: Text(
                                      data[2]["Title"],
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(18, 0, 0, 10),
                                    child: InkResponse(
                                      child: Icon(
                                        Icons.more_vert,
                                        size: 16,
                                        color: Colors.grey,
                                      ),
                                      onTap: () {},
                                      radius: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1.3,
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text(
                      "History",
                      style: TextStyle(),
                    ),
                    leading: Icon(
                      Icons.history,
                      color: Colors.grey,
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text("Downloads"),
                    subtitle: Text(
                      "40 recommendations",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    leading: Icon(
                      Icons.file_download,
                      color: Colors.grey,
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text("My videos"),
                    leading: Icon(
                      Icons.video_library,
                      color: Colors.grey,
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text("Purchase"),
                    leading: Icon(
                      Icons.local_offer,
                      color: Colors.grey,
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text("Watch later"),
                    subtitle: Text(
                      "153 unwatched videos",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    leading: Icon(
                      Icons.watch_later,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
