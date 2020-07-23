import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
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
                  dynamic result = await Navigator.pushNamed(context, '/pitch');
                },
                icon: Icon(
                  Icons.line_style,
                  color: Colors.white,
                ),
                label: Text(
                    'Add Pitch',
                    style: TextStyle(
                      color: Colors.white,
                    )
                )
            ),
            FlatButton.icon(
                onPressed: () async   {
                  dynamic result = await Navigator.pushNamed(context, '/lists');
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
                  dynamic result = await Navigator.pushNamed(context, '/maps');
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
                  dynamic result = await Navigator.pushNamed(context, '/innovreg');
                },
                icon: Icon(
                  Icons.line_style,
                  color: Colors.white,
                ),
                label: Text(
                    'Innovator Registration',
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
