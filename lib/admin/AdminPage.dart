import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {

  AdminPage({this.username});
  final String username;

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome Admin"),),
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