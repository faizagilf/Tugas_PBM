import 'dart:async';

import 'package:flutter/material.dart';

import 'package:utspbm/pages/login_page.dart';

void main() {
  runApp(SplashScreen());
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 4);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => LoginPage()
    ));
  }

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 249, 248, 248),
                gradient: LinearGradient(colors: [(Color.fromARGB(255, 194, 160, 147)), Color.fromARGB(255, 152, 126, 183)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                )
            ),
          ),
          Center(
            child: Container(
              child: Image.asset(
                "assets/images/launch_image.png",
                height: 150,
                width: 150,
              ),
              
            ),
          )
        ],
      ),
    );
  }
}