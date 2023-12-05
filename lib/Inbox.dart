import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:youtube/VideoPlayer.dart';

class Inbox extends StatefulWidget {
  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
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
      var convertdatatojson = json.decode(response.body);
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
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Column(
                children: <Widget>[
                  InkWell(
                    onTap: () => playVideo(data[0]['VideoURL']),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: SizedBox(
                            height: 35,
                            width: 35,
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(data[0]["ProfileiconURL"]),
                              radius: 20,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(12, 15, 0, 0),
                                child: Text(
                                  "${data[0]["Name"]} uploaded: ${data[0]["Title"]}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(12, 3, 0, 10),
                                child: Text(
                                  data[0]["Day"],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Image(
                            image: NetworkImage(data[0]["ThumbmnilURL"]),
                            width: 70,
                            height: 60,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          child: InkResponse(
                            onTap: () {},
                            radius: 10,
                            child: Icon(
                              Icons.more_vert,
                              size: 19,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => playVideo(data[1]['VideoURL']),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: SizedBox(
                            height: 35,
                            width: 35,
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(data[1]["ProfileiconURL"]),
                              radius: 20,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(12, 15, 0, 0),
                                child: Text(
                                  "${data[1]["Name"]} uploaded: ${data[1]["Title"]}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(12, 3, 0, 10),
                                child: Text(
                                  data[1]["Day"],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Image(
                            image: NetworkImage(data[1]["ThumbmnilURL"]),
                            width: 70,
                            height: 60,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          child: InkResponse(
                            onTap: () {},
                            radius: 10,
                            child: Icon(
                              Icons.more_vert,
                              size: 19,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => playVideo(data[2]['VideoURL']),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: SizedBox(
                            height: 35,
                            width: 35,
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(data[2]["ProfileiconURL"]),
                              radius: 20,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(12, 15, 0, 0),
                                child: Text(
                                  "${data[2]["Name"]} uploaded: ${data[2]["Title"]}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(12, 3, 0, 10),
                                child: Text(
                                  data[2]["Day"],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Image(
                            image: NetworkImage(data[2]["ThumbmnilURL"]),
                            width: 70,
                            height: 60,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          child: InkResponse(
                            onTap: () {},
                            radius: 10,
                            child: Icon(
                              Icons.more_vert,
                              size: 19,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
