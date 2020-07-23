import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../main.dart';
 String InnovatorId ='';
class Pitch extends StatefulWidget {
  Pitch({this.UserId});
  final String UserId;

  @override
  _PitchState createState() => _PitchState();
}

class _PitchState extends State<Pitch> {





  TextEditingController InnovID=new TextEditingController();
  TextEditingController PTitleC=new TextEditingController();
  TextEditingController PCategoryC=new TextEditingController();
  TextEditingController PBodyC=new TextEditingController();


  String msg='';




  Future<List> _login() async {
    final response2 = await http.post("http://10.254.165.49/meekdbapi/getinnovid.php", body: {
    "UserId": UserId,
    });
    print(UserId);
    var datauser2 = json.decode(response2.body);
    print(datauser2);
    InnovatorId= datauser2[0]['InnovatorId'];
    print(InnovatorId);

    final response = await http.post("http://10.254.165.49/meekdbapi/addpitch.php", body: {
      "InnovatorID": InnovatorId,
      "PTitle": PTitleC.text,
      "PCategory":PCategoryC.text,
      "PBody":PBodyC.text,
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
                controller: InnovID,
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
                  hintText: 'Enter InnovatorID',
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
                controller: PTitleC,
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
                  hintText: 'Enter PTitle',
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
                controller: PCategoryC,
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
                  hintText: 'Enter PCategory',
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
                controller: PBodyC,
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
                  hintText: 'Enter PBody',
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
                'Add Pitch',
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
