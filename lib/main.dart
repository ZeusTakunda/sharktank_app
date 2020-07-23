import 'dart:convert';

import 'package:flutter/material.dart';
import 'admin/OnBoarding/backgroundtwo.dart';
import 'admin/loginpage/login.dart';
import 'file:///C:/Users/muyen/AndroidStudioProjects/sharktank_app/lib/admin/AdminPage.dart';
import 'file:///C:/Users/muyen/AndroidStudioProjects/sharktank_app/lib/navigation/Maps.dart';
import 'file:///C:/Users/muyen/AndroidStudioProjects/sharktank_app/lib/navigation/Maps2.dart';
import 'file:///C:/Users/muyen/AndroidStudioProjects/sharktank_app/lib/admin/MemberPage.dart';
import 'file:///C:/Users/muyen/AndroidStudioProjects/sharktank_app/lib/admin/home.dart';
import 'file:///C:/Users/muyen/AndroidStudioProjects/sharktank_app/lib/admin/home2.dart';
import 'file:///C:/Users/muyen/AndroidStudioProjects/sharktank_app/lib/admin/innovatoregistration.dart';
import 'file:///C:/Users/muyen/AndroidStudioProjects/sharktank_app/lib/admin/investorregistration.dart';
import 'file:///C:/Users/muyen/AndroidStudioProjects/sharktank_app/lib/pitches/listview.dart';
import 'file:///C:/Users/muyen/AndroidStudioProjects/sharktank_app/lib/meetings/meeting.dart';
import 'file:///C:/Users/muyen/AndroidStudioProjects/sharktank_app/lib/pitches/pitch.dart';
import 'file:///C:/Users/muyen/AndroidStudioProjects/sharktank_app/lib/admin/register.dart';
import 'package:http/http.dart' as http;
import 'file:///C:/Users/muyen/AndroidStudioProjects/sharktank_app/lib/pitches/viewpitch.dart';

import 'meetings/addmeeting.dart';

String username = '';
String  UserId =' ';
String PId=' ';
String Ptitle ='';
String PBody ='';
String PCategory = '';


void main() {

  runApp(MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/home': (context) => Home(),
        '/home2': (context) => Home2(),
        '/members': (context) => MemberPage(username: username),
        '/admin': (context) => AdminPage(username: username),
        '/pitch': (context) => Pitch(UserId:UserId),
        '/viewpitch': (context) => ViewPitch(UserId:UserId),
        '/addmeeting': (context) => AddMeeting(username:username),
        '/maps':(context) => MapsDemo(),
        '/maps2':(context) => MapSample(),
        '/meeting':(context) => Meeting(username:username),
        '/investoreg':(context) => InvestorReg(UserId:UserId),
        '/innovreg':(context)=>InnovReg(UserId:UserId),
        '/lists':(context)=>HomePage(UserId:UserId),
        '/startup': (context)=>BodyPage(),
      }
  ));
}

  class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();


  }

  class _LoginState extends State<Login> {

//  String username='';

  TextEditingController user=new TextEditingController();
  TextEditingController pass=new TextEditingController();

  String msg='';

  Future<List> _login() async {
  final response = await http.post("http://10.254.165.49/meekdbapi/login.php", body: {
  "Email": user.text,
  "Password": pass.text,
  });

  var datauser = json.decode(response.body);
  print(datauser);
  username= datauser[0]['Email'];
  UserId= datauser[0]['UserId'];
  print(username);
  print(UserId);

  if(datauser.length==0){
  setState(() {
  msg="Login Fail";
  });
  }else{
  if(datauser[0]['UserType']=='Innovator'){
  Navigator.pushReplacementNamed(context, '/home');
  }else if(datauser[0]['UserType']=='Investor'){
  Navigator.pushReplacementNamed(context, '/home2');
  }else{
    Navigator.pushReplacementNamed(context, '/');

  }

  setState(() {
  username= datauser[0]['Email'];

  });

  }
  Map data = datauser;
  return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.pink,
      body: SafeArea(
        child: Flexible(
          child: ListView(
              children: <Widget>[
  SizedBox(height: 50),
  Text('Sign In',
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
  controller: user,
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
              SizedBox(height: 10.0),
              Padding(
              padding: const EdgeInsets.fromLTRB(12.0,1.0,12.0,1),
              child: Container(
              alignment: Alignment.centerLeft,
              height: 60.0,
              child: TextFormField(
              obscureText: true,
              controller:  pass,
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
              ),
              FlatButton.icon(
              onPressed: ()   {
              _login();
  },
  icon: Icon(
  Icons.verified_user,
  color: Colors.grey[300],
  ),
  label: Text(
  'Login',
  style: TextStyle(
  color: Colors.grey[300],
  )
  ),
  ),
  FlatButton.icon(
  onPressed: () async   {
  dynamic result = await Navigator.pushNamed(context, '/register');
  },
  icon: Icon(
  Icons.line_style,
  color: Colors.white,
  ),
  label: Text(
  'Sign Up',
  style: TextStyle(
  color: Colors.white,
  )
  )
  ),


  ],
  ),
  ),

  ),
    );

  }

  }
