import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:youtube/VideoPlayer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    return Container(
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
    );
  }
}
