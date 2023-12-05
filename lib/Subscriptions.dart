import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:youtube/VideoPlayer.dart';

class Subscriptions extends StatefulWidget {
  @override
  _SubscriptionsState createState() => _SubscriptionsState();
}

class _SubscriptionsState extends State<Subscriptions> {
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
        Stack(
          children: <Widget>[
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
//********************** Music ****************************
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 15, 10, 7),
                        child: InkResponse(
                          child: CircleAvatar(
                            radius: 28,
                            backgroundImage: NetworkImage(
                              "https://sakshamchoudhary.com/assets/images/me.jpg",
                            ),
                          ),
                          onTap: () {},
                          containedInkWell: false,
                          radius: 45,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(12, 0, 15, 7),
                        child: Text(
                          "Saksham",
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
                          child: CircleAvatar(
                            radius: 28,
                            backgroundImage: NetworkImage(
                                "https://qph.fs.quoracdn.net/main-raw-367781202-qepmjuksoivuscpwslisapfeofulpvyn.jpeg"),
                          ),
                          onTap: () {},
                          containedInkWell: false,
                          radius: 45,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(4, 0, 15, 7),
                        child: Text(
                          "Hitesh Ch...",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),

//******************* Technical Gu.. ****************************
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 15, 15, 7),
                        child: InkResponse(
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto/gigs/85146496/original/0d620ca76d1895032530c761ec152dc4092a877d/create-a-logo-like-technical-guruji.jpg"),
                            radius: 28,
                          ),
                          onTap: () {},
                          containedInkWell: false,
                          radius: 45,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(4, 0, 15, 7),
                        child: Text(
                          "Technical",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),

//******************* Zee Co. ****************************
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 15, 15, 7),
                        child: InkResponse(
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              "https://yt3.ggpht.com/a/AGF-l7-o-FQ4aEdqCMNlLpCqpeF2kTtgTP33V8X5-g=s900-c-k-c0xffffffff-no-rj-mo",
                            ),
                            radius: 28,
                          ),
                          onTap: () {},
                          containedInkWell: false,
                          radius: 45,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(4, 0, 15, 7),
                        child: Text(
                          "Zee Co.",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),

//******************* Aaj Tak ****************************
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 15, 15, 7),
                        child: InkResponse(
                          child: CircleAvatar(
                            radius: 28,
                            backgroundImage: NetworkImage(
                              "https://1.bp.blogspot.com/-Y4_KUXGe6tY/VqpE5ixje7I/AAAAAAAABvU/i3Clk11reTU/s1600/Aaj%2BTak.png",
                            ),
                          ),
                          onTap: () {},
                          containedInkWell: false,
                          radius: 45,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(4, 0, 15, 7),
                        child: Text(
                          "Aaj Tak",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),

//*********************** Google ***************************

                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 15, 15, 7),
                        child: InkResponse(
                          child: CircleAvatar(
                            radius: 28,
                            backgroundImage: NetworkImage(
                              "https://static.wixstatic.com/media/4a8176_6b644eece35c4e7588411663df2b1560~mv2.png/v1/fill/w_1000,h_1000,al_c,q_90/file.jpg",
                            ),
                          ),
                          onTap: () {},
                          containedInkWell: false,
                          radius: 45,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(4, 0, 15, 7),
                        child: Text(
                          "Google",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),

//*********************** Chrome ***************************
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 15, 15, 7),
                        child: InkResponse(
                          child: CircleAvatar(
                            radius: 28,
                            backgroundImage: NetworkImage(
                              "https://www.stickpng.com/assets/images/588525cd6f293bbfae451a37.png",
                            ),
                          ),
                          onTap: () {},
                          containedInkWell: false,
                          radius: 45,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(4, 0, 15, 7),
                        child: Text(
                          "Chrome",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),

//*********************** Apple ***************************
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 15, 15, 7),
                        child: InkResponse(
                          child: CircleAvatar(
                            radius: 28,
                            backgroundImage: NetworkImage(
                              "https://purepng.com/public/uploads/large/21502362885rmhziap3wm5w0jogfdubr1fgyzuycu5rqkam39wjhh7yhmcncxka3vxq3xglitq4iwze8v0gpi1wmolyrtqkts57kit8ibyd2apb.png",
                            ),
                          ),
                          onTap: () {},
                          containedInkWell: false,
                          radius: 45,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(4, 0, 15, 7),
                        child: Text(
                          "Apple",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),

//********************* Firefox *********************************
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 15, 15, 7),
                        child: InkResponse(
                          child: CircleAvatar(
                            radius: 28,
                            backgroundImage: NetworkImage(
                              "https://www.stickpng.com/assets/images/5847f407cef1014c0b5e4889.png",
                            ),
                          ),
                          onTap: () {},
                          containedInkWell: false,
                          radius: 45,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(4, 0, 15, 7),
                        child: Text(
                          "Firefox",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),

//********************* Facebook *********************************
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 15, 60, 7),
                        child: InkResponse(
                          child: CircleAvatar(
                            radius: 28,
                            backgroundImage: NetworkImage(
                              "https://www.freepnglogos.com/uploads/facebook-icons/facebook-icon-transparent-background-3.png",
                            ),
                          ),
                          onTap: () {},
                          containedInkWell: false,
                          radius: 45,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(4, 0, 60, 7),
                        child: Text(
                          "Facebook",
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
            Positioned(
              left: 310,
              child: MaterialButton(
                onPressed: () {},
                height: 110,
                color: Color(0xff303030),
                minWidth: 10,
                child: Text(
                  "ALL",
                  style: TextStyle(
                    color: Colors.lightBlue
                  ),
                ),
              ),
            ),
          ],
        ),

        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Divider(
            color: Colors.grey,
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
                      itemBuilder: (context, index) => Column(
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
                                  backgroundImage: NetworkImage(
                                      data[index]["ProfileiconURL"]),
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
