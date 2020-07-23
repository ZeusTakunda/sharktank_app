import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../main.dart';

class HomePage extends StatefulWidget {
  HomePage({this.UserId});
  final String UserId;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map data;
  List userData;

  Future getData() async {


    var response2 = await http.post("http://10.254.165.49/meekdbapi/getinnovid.php", body: {
      "UserId": UserId,
    });
    print(UserId);
    String InnovatorId = '';
    var datauser2 = json.decode(response2.body);
    print(datauser2);
    InnovatorId= datauser2[0]['InnovatorId'];
    print(InnovatorId);


    http.Response response = await http.post("http://10.254.165.49/meekdbapi/getpitch.php", body: {
      "InnovatorID":InnovatorId,
    });

//    http.Response response2 = await http.get("https://reqres.in/api/users?page=2");
    userData = json.decode(response.body);
    print(userData);
     setState(() {
//        userData;
      });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fake Friends"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: userData == null ? 0 : userData.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
//                    backgroundImage: NetworkImage(userData[index]["PBody"]),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("PitchID: ${userData[index]["PitchID"]}  \n PitchTitle:${userData[index]["PTitle"]}\n PBody: ${userData[index]["PBody"]} \n PitchCategory:${userData[index]["PCategory"]}",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),),),

                  ),
//                    Padding(
//                      padding: const EdgeInsets.all(10.0),
//                      child: Text("${userData[index]["PBody"]} \n ${userData[index]["PCategory"]}",
//                        style: TextStyle(
//                          fontSize: 20.0,
//                          fontWeight: FontWeight.w700,
//                        ),),
//                    ),

                ],
              ),
            ),

          );
        },
      ),

    );
  }
}
