import 'package:flutter/material.dart';


class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50, width: 50),
            Center(
              child: Text(
                'Welcome to Jasper',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  textBaseline: TextBaseline.ideographic,
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),

            FlatButton.icon(
                onPressed: () async   {
                  dynamic result = await Navigator.pushNamed(context, '/viewpitch');
                },
                icon: Icon(
                  Icons.line_style,
                  color: Colors.white,
                ),
                label: Text(
                    'See current pitches',
                    style: TextStyle(
                      color: Colors.white,
                    )
                )
            ),
            FlatButton.icon(
                onPressed: () async   {
                  dynamic result = await Navigator.pushNamed(context, '/maps2');
                },
                icon: Icon(
                  Icons.line_style,
                  color: Colors.white,
                ),
                label: Text(
                    'Use Maps',
                    style: TextStyle(
                      color: Colors.white,
                    )
                )
            ),
            FlatButton.icon(
                onPressed: () async   {
                  dynamic result = await Navigator.pushNamed(context, '/meeting');
                },
                icon: Icon(
                  Icons.line_style,
                  color: Colors.white,
                ),
                label: Text(
                    'Meeting',
                    style: TextStyle(
                      color: Colors.white,
                    )
                )
            ),
            FlatButton.icon(
                onPressed: () async   {
                  dynamic result = await Navigator.pushNamed(context, '/addmeeting');
                },
                icon: Icon(
                  Icons.line_style,
                  color: Colors.white,
                ),
                label: Text(
                    'Add Meeting',
                    style: TextStyle(
                      color: Colors.white,
                    )
                )
            ),
            FlatButton.icon(
                onPressed: () async   {
                  dynamic result = await Navigator.pushNamed(context, '/investoreg');
                },
                icon: Icon(
                  Icons.line_style,
                  color: Colors.white,
                ),
                label: Text(
                    'investor Registration',
                    style: TextStyle(
                      color: Colors.white,
                    )
                )
            ),



          ],

        ),
      ),

    );
  }
}
