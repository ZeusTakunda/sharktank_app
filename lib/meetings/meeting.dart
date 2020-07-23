import 'package:flutter/cupertino.dart';
import 'dart:core';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'file:///C:/Users/muyen/AndroidStudioProjects/sharktank_app/lib/pitches/pitch.dart';

import '../main.dart';

String InvestorEmail = '';
String location= '';
String date= '';
String time = '';

class Meeting extends StatefulWidget {

  Meeting({this.username});
  final String username;

  @override
  _MeetingState createState() => _MeetingState();
}

class _MeetingState extends State<Meeting> {

  Future<List> _login() async {
    final response = await http.post("http://10.254.165.49/meekdbapi/getmeeting.php", body: {
      "Innovemail": username,
    });


    var datauser = jsonDecode(response.body);
    print(datauser);
    InvestorEmail = datauser[0]['InvestorEmail'];
    location = datauser[0]['location'];
    date = datauser[0]['date'];
    time = datauser[0]['time'];


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
    //  return datauser;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(title: Text("Meetings"),
        backgroundColor: Colors.teal[400],),
      body: Column(
        children: <Widget>[
          Text('Investor email:  $InvestorEmail', style: TextStyle(fontSize: 20.0,color: Colors.white),),
          Text('Meeting Location: $location', style:TextStyle(fontSize: 20.0,color: Colors.white),),
          Text('Meeting Date:  $date', style: TextStyle(fontSize: 20.0,color: Colors.white),),
          Text('Meeting Time:  $time', style: TextStyle(fontSize: 20.0,color: Colors.white),),


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


