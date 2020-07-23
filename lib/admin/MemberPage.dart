import 'package:flutter/material.dart';

class MemberPage extends StatefulWidget {

  MemberPage({this.username});
  final String username;

  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome Member"),),
      body: Column(
        children: <Widget>[
          Text('Hallo ${widget.username}', style: TextStyle(fontSize: 20.0),),

          RaisedButton(
            child: Text("LogOUt"),
            onPressed: (){
              Navigator.pushReplacementNamed(context,'/MyHomePage');
            },
          ),
        ],
      ),
    );
  }
}