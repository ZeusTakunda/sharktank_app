import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../main.dart';
String InnovatorId ='';
class AddMeeting extends StatefulWidget {
  AddMeeting({this.username});
  final String username;

  @override
  _AddMeetingState createState() => _AddMeetingState();
}

class _AddMeetingState extends State<AddMeeting> {





  TextEditingController innovemail=new TextEditingController();
  TextEditingController location =new TextEditingController();
  TextEditingController date=new TextEditingController();
  TextEditingController time=new TextEditingController();


  String msg='';




  Future<List> _login() async {
        final response = await http.post("http://10.254.165.49/meekdbapi/addmeeting.php", body: {
      "InvestorEmail": username,
      "InnovatorEmail": innovemail.text,
      "location":location.text,
      "date":date.text,
       "time":time.text,

        });


    var datauser = response.body;
    print(datauser);

    if(datauser.length==0){
      setState(() {
        msg="Login Fail";
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
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            Text('Add Pitch',
              style:TextStyle(
                fontSize: 30,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0,1.0,12.0,1),
              child: Container(
                alignment: Alignment.centerLeft,
                height: 60.0,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: innovemail,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    hintText: 'Enter innovator email',
                    hintStyle: TextStyle(
                        color:Colors.white
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0,1.0,12.0,1),
              child: Container(
                alignment: Alignment.centerLeft,
                height: 60.0,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: location,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    hintText: 'Enter location',
                    hintStyle: TextStyle(
                        color:Colors.white
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0,1.0,12.0,1),
              child: Container(
                alignment: Alignment.centerLeft,
                height: 60.0,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: date,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    hintText: 'Enter date',
                    hintStyle: TextStyle(
                        color:Colors.white
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0,1.0,12.0,1),
              child: Container(
                alignment: Alignment.centerLeft,
                height: 60.0,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: time,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    hintText: 'Enter time',
                    hintStyle: TextStyle(
                        color:Colors.white
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),

            FlatButton.icon(
              onPressed: ()   {
                _login();
              },
              icon: Icon(
                Icons.verified_user,
                color: Colors.grey[300],
              ),
              label: Text(
                  'Add Meeting ',
                  style: TextStyle(
                    color: Colors.grey[300],
                  )
              ),
            ),

          ],
        ),
      ),

    );
  }
}
