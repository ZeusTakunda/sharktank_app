import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

String InnovatorEmail = '';
String InnovatorPassword = '';
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String username='';

  String dropdownValue = 'One';


  TextEditingController fname=new TextEditingController();
  TextEditingController lname=new TextEditingController();
  TextEditingController pass =new TextEditingController();
  TextEditingController email=new TextEditingController();
  TextEditingController usertype=new TextEditingController();
  TextEditingController address=new TextEditingController();
  TextEditingController phonenumber =new TextEditingController();
  TextEditingController province=new TextEditingController();


  String msg='';

  Future<List> _login() async {
    final response = await http.post("http://10.254.165.49/meekdbapi/register.php", body: {
      "FirstName": fname.text,
      "LastName": lname.text,
      "Password": pass.text,
      "Email": email.text,
      "UserType": usertype.text,
      "Address":address.text,
      "PhoneNumber": phonenumber.text,
      "Province":province.text

    });

    var datauser = response.body;
    print(datauser);
    InnovatorEmail = email.text;
    InnovatorPassword= pass.text;
    if(datauser.length==0){
      setState(() {
        msg="Login Fail";
      });
    }else{
      if(datauser=='<!-- 1 -->'){
        if(usertype.text=='Innovator')
          {
            Navigator.pushReplacementNamed(context, '/innovreg');
          }else if(usertype.text=='Investor')
            {
              Navigator.pushReplacementNamed(context, '/investoreg');

            }

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
        child: Flexible(
          child: ListView(
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
                    controller:fname,
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
                      hintText: 'Enter Your First Name',
                      hintStyle: TextStyle(
                          color:Colors.white
                      ),
                    ),
                  ),
                ),
              ),
                        TextField(
                          keyboardType: TextInputType.text,
                          controller:lname,
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
                            hintText: 'Enter Your Last Name',
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
                    controller: email,
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
                      hintText: 'Enter your Email',
                      hintStyle: TextStyle(
                          color:Colors.white
                      ),
                    ),
                  ),
                ),
              ),
          TextField(
            keyboardType: TextInputType.text,
            controller:usertype,
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
              hintText: 'Enter Your Member Type Here',
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
                    obscureText: true,
                    controller: pass,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14.0),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      hintText: 'Enter your Password',
                      hintStyle: TextStyle(
                          color:Colors.white
                      ),
                    ),
                  ),
                ),
              ),TextField(
                keyboardType: TextInputType.text,
                controller:address,
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
                  hintText: 'Enter Your Address Here',
                  hintStyle: TextStyle(
                      color:Colors.white
                  ),
                ),
              ),

                    TextField(
                      keyboardType: TextInputType.text,
                      controller:phonenumber,
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
                        hintText: 'Enter Your Phone Number Here',
                        hintStyle: TextStyle(
                            color:Colors.white
                        ),
                      ),
                    ),
                  TextField(
                    keyboardType: TextInputType.text,
                    controller:province,
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
                      hintText: 'Enter Your Province Here',
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
      ),
    );
  }
}
