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
  // File fileMedia;
  // MediaSource source;
  File videoFile;

  // VideoPlayerController controller = VideoPlayerController();

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

                ClipRRect(
                    child: Image.asset(
                      'lib/assets/logo04.jpeg',
                      width: 180.0,
                      height: 180.0,
                    ),
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                Container(
                  child: Text('THAI SIGN LANGUAGE TRANSLATION',
                    style: TextStyle(color: Colors.white),),),
                Container(
                  child: RaisedButton(
                      child: Text('Camera',),
                    shape: StadiumBorder(),
                    onPressed: () {
                      videoMedia();
                    },
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                  ),),
                Container(
                  child: RaisedButton(
                    child: Text('Gallery'),
                    shape: StadiumBorder(),
                    onPressed: () {
                      galleryMedia();
                    },
                    color: Theme
                        .of(context)
                        .primaryColor,
                    textColor: Colors.white,
                  ),),
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
