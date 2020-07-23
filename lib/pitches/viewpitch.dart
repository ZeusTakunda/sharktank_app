import 'dart:core';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'file:///C:/Users/muyen/AndroidStudioProjects/sharktank_app/lib/pitches/pitch.dart';

import '../main.dart';
String PId = '';
String Ptitle= '';
String PBody= '';
String PCategory = '';

class ViewPitch extends StatefulWidget {

  ViewPitch({this.UserId});
  final String UserId;

  @override
  _ViewPitchState createState() => _ViewPitchState();
}

class _ViewPitchState extends State<ViewPitch> {


  Future<List> _login() async {
    var response2 = await http.post("http://10.254.165.49/meekdbapi/getinnovid.php", body: {
      "UserId": UserId,
    });
    print(UserId);
    var datauser2 = json.decode(response2.body);
    print(datauser2);
    InnovatorId= datauser2[0]['InnovatorId'];
    print(InnovatorId);

    var response = await http.post("http://10.254.165.49/meekdbapi/getpitch.php", body: {
      "InnovatorID": InnovatorId,
    });


    var datauser = jsonDecode(response.body);
//    List<Pitches> pitches = [];
//    for(var u in datauser){
//      Pitches pitchs = Pitches(u["PitchID"],u["PTitle"],u["PBody"],u["PCategory"]);
//
//      pitches.add(pitchs);
//    }
//     print(pitches.length);


    print(datauser);
    PId = datauser[0]['PitchID'];
    Ptitle = datauser[0]['PTitle'];
    PBody = datauser[0]['PBody'];
    PCategory = datauser[0]['PCategory'];

   print('This is PiD:$PId');
    if(datauser.length==0){
      setState(() {
//        msg="Login Fail";
      });
    }else{
      if(datauser=='<!-- 1 -->'){
        Navigator.pushReplacementNamed(context, '/home');
      }else if(datauser ==' Hey success'){
        Navigator.pushReplacementNamed(context, '/home');
      }

      setState(() {
//        username= datauser[0]['username'];
      });

    }
//    return pitches;
      return datauser;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(title: Text("Welcome Admin"),
      backgroundColor: Colors.teal[400],),
      body: Column(children: <Widget>[
      Text('Hallo $PId', style: TextStyle(fontSize: 20.0),),


          RaisedButton(
            child: Text("Refresh"),
            onPressed: (){
//              Navigator.pushReplacementNamed(context,'/MyHomePage');
            _login();
            },
          ),
        ],
      ),
    );
  }
  }

  class Pitches
  {
    final int PitchId2;
    final String Ptitle2;
    final String PBody2;
    final String PCategory2;

    Pitches(this.PitchId2,this.Ptitle2,this.PBody2,this.PCategory2);
  }

