import 'package:flutter/material.dart';
//import 'package:flutter_auth/Screens/Login/components/background.dart';
//import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
//import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
//import 'package:flutter_auth/components/rounded_button.dart';
//import 'package:flutter_auth/components/rounded_input_field.dart';
//import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sharktank_app/components/already_have_an_account_acheck.dart';
import 'package:sharktank_app/components/rounded_input_field.dart';
import 'package:sharktank_app/components/rounded_password_field.dart';
import 'file:///C:/Users/muyen/AndroidStudioProjects/sharktank_app/lib/admin/register.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'file:///C:/Users/muyen/AndroidStudioProjects/sharktank_app/lib/admin/AdminPage.dart';
import 'file:///C:/Users/muyen/AndroidStudioProjects/sharktank_app/lib/navigation/Maps.dart';
import 'file:///C:/Users/muyen/AndroidStudioProjects/sharktank_app/lib/navigation/Maps2.dart';
import 'file:///C:/Users/muyen/AndroidStudioProjects/sharktank_app/lib/admin/MemberPage.dart';
import 'file:///C:/Users/muyen/AndroidStudioProjects/sharktank_app/lib/meetings/addmeeting.dart';
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
import '../../main.dart';
import 'backgroundtwo.dart';
import '../../components/roundedbutton.dart';
import '../home.dart';
String username = '';
String  UserId =' ';
String PId=' ';
String Ptitle ='';
String PBody ='';
String PCategory = '';

class BodyT extends StatefulWidget {
  const BodyT({
    Key key,
  }) : super(key: key);

  @override
  _BodyTState createState() => _BodyTState();
}

class _BodyTState extends State<BodyT> {

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
    Size size = MediaQuery.of(context).size;
    return BackgroundT(

      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.20,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {

              },
            ),
            RoundedPasswordField(
              onChanged: (value) {


              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {

                 return Login();
                            },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Register();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
