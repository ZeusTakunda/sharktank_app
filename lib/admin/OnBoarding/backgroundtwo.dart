import 'package:flutter/material.dart';

class BackgroundT extends StatefulWidget {
  final Widget child;
  const BackgroundT({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  _BackgroundTState createState() => _BackgroundTState();
}

class _BackgroundTState extends State<BackgroundT> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color:Colors.white,
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_top.png",
              width: size.width * 0.35,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "assets/images/login_bottom.png",
              width: size.width * 0.4,
            ),
          ),
          widget.child,
        ],
      ),
    );
  }
}
