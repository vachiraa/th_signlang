import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

import 'package:th_signlang/model/media_source.dart';
import 'package:th_signlang/pages/processing.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  File videoFile;
  

  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(54, 54, 54, 100),
      body: SafeArea(
        child: Center(
          // decoration: BoxDecoration(gradient: LinearGradient(colors: [Color.fromRGBO(54, 54, 54, 100)],
          // begin: Alignment.topCenter,end: Alignment.bottomCenter)),
          child: Column(
              children: <Widget>[

                Container(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 130, 10, 10),
                  child: ClipRRect(
                    child: Image.asset(
                      'lib/assets/logo04.jpeg',
                      // width: 160.0,
                      // height: 160.0,
                      width: MediaQuery.of(context).size.width *  0.35,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),),),
                Container(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 45),
                    child: Text('''THAI SIGN LANGUAGE 
       TRANSLATION''',
                    style: TextStyle(color: Colors.white, fontSize: 18),),),),
                Container(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 15),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width *  0.40,
                      child: RaisedButton(
                        child: Text('Camera', style: TextStyle(fontSize: 23),),
                      shape: StadiumBorder(),
                      onPressed: () {videoMedia();},
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                  ),),),),
                Container(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width *  0.40,
                    child: RaisedButton(
                      child: Text('Gallery', style: TextStyle(fontSize: 23)),
                      shape: StadiumBorder(),
                      onPressed: () {
                      galleryMedia();
                    },
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(35, 10, 35, 10),
                  ),),),),
              ],
          ),
          ),
        ),
      );
  }

  Future videoMedia() async {
    final getVideo = await ImagePicker.pickVideo(
        source: ImageSource.camera); // final getMedia = ImagePicker().getVideo;

    if (getVideo != null) {
      setState(() {
        videoFile = getVideo;
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ProcessingPage(videoFile: videoFile)));
      });
    }
  }

  Future galleryMedia() async {
    File getVideo = await ImagePicker.pickVideo(source: ImageSource.gallery);

    if (getVideo != null) {
      setState(() {
        videoFile = getVideo;
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ProcessingPage(videoFile: videoFile,)));
      });
    }
  }


}
