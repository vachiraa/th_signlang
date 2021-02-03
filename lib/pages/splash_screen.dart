import 'dart:async';
import 'package:flutter/material.dart';
import 'package:th_signlang/pages/home.dart';
import 'package:splashscreen/splashscreen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () =>
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(54, 54, 54, 100),
        body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(color: Colors.black87),
              ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
             Expanded(
               flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 300.0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(25.0),

                              // child: Image.asset('lib/assets/logo5.png',
                              child: Image.asset('lib/assets/logo04.jpeg',
                                width: MediaQuery.of(context).size.width * 0.30,
                                fit: BoxFit.cover,
                              ),
                            // ),
                          ),
                        ),
                    ],
                    ),),
    ),

    ],

    )
    ],
    ));
  }
}
