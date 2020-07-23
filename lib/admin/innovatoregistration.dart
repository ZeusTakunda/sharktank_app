import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sharktank_app/main.dart';
import 'file:///C:/Users/muyen/AndroidStudioProjects/sharktank_app/lib/admin/register.dart';
import 'file:///C:/Users/muyen/AndroidStudioProjects/sharktank_app/lib/admin/register.dart';


class InnovReg extends StatefulWidget {
  InnovReg({this.UserId});
  final String UserId;

  @override
  _InnovRegState createState() => _InnovRegState();
}

class _InnovRegState extends State<InnovReg> {
  String username='';

  String dropdownValue = 'One';
  TextEditingController user=new TextEditingController();
  TextEditingController pass=new TextEditingController();
  TextEditingController DOB=new TextEditingController();
  TextEditingController Id_Passport=new TextEditingController();
  TextEditingController EmploymentStatus =new TextEditingController();
  TextEditingController Nationality=new TextEditingController();



  String msg='';
  // InnovatorEmail


  Future<List> _login() async {


    final response2 = await http.post("http://10.254.165.49/meekdbapi/login.php", body: {
      "Email": user.text,
      "Password": pass.text,
    });

    var datauser2 = json.decode(response2.body);
    print(datauser2);
    username= datauser2[0]['Email'];
    UserId= datauser2[0]['UserId'];
    print(username);
    print(UserId);


    final response = await http.post("http://10.254.165.49/meekdbapi/addinnovator.php", body: {
     "UserId": UserId,
      "DOB": DOB.text,
      "Id_Passport": Id_Passport.text,
      "EmploymentStatus": EmploymentStatus.text,
      "Nationality": Nationality.text,


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
    return Scaffold (
      backgroundColor: Colors.pink,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Text('Sign Up',
              style:TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0,1.0,12.0,1),
              child: Container(
                alignment: Alignment.centerLeft,
                height: 60.0,
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller:user,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                    ),
                    hintText: 'Confirm Email',
                    hintStyle: TextStyle(
                        color:Colors.white
                    ),
                  ),
                ),

              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              controller:pass,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                hintText: 'Confirm Password',
                hintStyle: TextStyle(
                    color:Colors.white
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              controller:DOB,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                hintText: 'DOB',
                hintStyle: TextStyle(
                    color:Colors.white
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              controller:Id_Passport,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                hintText: 'DOB',
                hintStyle: TextStyle(
                    color:Colors.white
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0,1.0,12.0,1),
              child: Container(
                alignment: Alignment.centerLeft,
                height: 60.0,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: EmploymentStatus,
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
                    hintText: 'EmploymentStatus',
                    hintStyle: TextStyle(
                        color:Colors.white
                    ),
                  ),
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              controller:Nationality,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                hintText: 'Nationality',
                hintStyle: TextStyle(
                    color:Colors.white
                ),
              ),
            ),



//          DropdownButton<String>(
//            value: dropdownValue,
//            icon: Icon(Icons.arrow_downward),
//            iconSize: 24,
//            elevation: 16,
//            style: TextStyle(color: Colors.deepPurple),
//            underline: Container(
//              height: 2,
//              color: Colors.deepPurpleAccent,
//            ),
//            onChanged: (String newValue) {
//              setState(() {
//                dropdownValue = newValue;
//              });
//            },
//            items: <String>['One', 'Two', 'Free', 'Four']
//                .map<DropdownMenuItem<String>>((String value) {
//              return DropdownMenuItem<String>(
//                value: value,
//                child: Text(value),
//              );
//            }).toList(),
//          ),
            FlatButton.icon(
              onPressed: ()   {
                _login();
              },
              icon: Icon(
                Icons.verified_user,
                color: Colors.grey[300],
              ),
              label: Text(
                  'Register',
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
