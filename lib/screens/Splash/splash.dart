import 'package:flutter/material.dart';
import 'dart:async';

import 'package:spree/screens/Home/main_widget.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  Animation logoanimation, textanimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    logoanimation = Tween(begin: 25.0, end: 100.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceOut));
    textanimation = Tween(begin: 0.0, end: 27.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    logoanimation.addListener(() => this.setState(() {}));
    textanimation.addListener(() => this.setState(() {}));
    animationController.forward();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => HomePage())));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Color(0xff0059ff)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "SPREE",
                    style: TextStyle(
                        fontFamily: 'Agne',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 46),
                  )
                ],
              )),
            ],
          ),
        ],
      ),
    );
  }
}
