import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';


class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}
// class _SplashScreenState extends State<SplashScreen>{
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Image.asset('assets/logo.png')
//       ),
//     );
//   }
// }

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
      child: new Text(
        'Welcome In SplashScreen',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      // seconds: 8,
      // navigateAfterSeconds: AfterSplash(),
      // image: new Image.asset(
      //     'assets/loading.gif'),
      // backgroundColor: Colors.black,
      // styleTextUnderTheLoader: new TextStyle(),
      // photoSize: 150.0,
      // onClick: () => print("Flutter Egypt"),
      // loaderColor: Colors.white,
      )
    );
  }
}
//
// class AfterSplash extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         backgroundColor: Colors.black,
//         title: new Text("Welcome In SplashScreen Package"),
//         automaticallyImplyLeading: false,
//       ),
//       body: new Center(
//         child: new Text(
//           "Succeeded!",
//           style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
//         ),
//       ),
//     );
//   }
// }