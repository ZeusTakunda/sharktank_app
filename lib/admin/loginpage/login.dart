import 'package:flutter/material.dart';
//import 'package:flutter_auth/Screens/Login/login_screen.dart';
//import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
//import 'package:flutter_auth/Screens/Welcome/components/background.dart';
//import 'package:flutter_auth/components/rounded_button.dart';
//import 'package:flutter_auth/constants.dart';
import 'package:flutter_svg/svg.dart';

import '../../main.dart';
import 'background.dart';
import '../../components/roundedbutton.dart';
import '../../components/constants.dart';
import '../OnBoarding/landpage.dart';
import '../OnBoarding/loginentry.dart';

class BodyPage extends StatefulWidget {
  @override
  _BodyPageState createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: Flexible(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "WELCOME TO JASPER",
                style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.black),
              ),
              SizedBox(height: size.height * 0.05),
              SvgPicture.asset(
                "assets/icons/piechart.svg",
                height: size.height * 0.20,
              ),
              SizedBox(height: size.height * 0.05),
              RoundedButton(
                text: "LOGIN",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Login();
                      },
                    ),
                  );
                },
              ),
              RoundedButton(
                text: "SIGN UP",
                color: kPrimaryLightColor,
                textColor: Colors.black,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
