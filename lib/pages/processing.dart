// import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:th_signlang/pages/home.dart';
import 'package:th_signlang/pages/translation.dart';
import 'package:th_signlang/widget/video_widget.dart';

class ProcessingPage extends StatefulWidget {
  final File videoFile;

  ProcessingPage({Key key, this.videoFile}) : super(key: key);

  @override
  _ProcessingPageState createState() => _ProcessingPageState();
}

class _ProcessingPageState extends State<ProcessingPage> {
  var video;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(54, 54, 54, 100),
      appBar: AppBar(
        title: Text('Processing '),
        // backgroundColor: Color.fromRGBO(251, 188, 27, 100),
      ),
      body: SafeArea(
          child: Center(
              child: ListView(
        children: <Widget>[
          Container(
            color: Colors.grey,
            // height: MediaQuery.of(context).size.height * (0.6),
            // width: MediaQuery.of(context).size.width * (1),
            // height: 500,
            // width: 90,
            child: widget.videoFile == null
                ? Icon(
                    Icons.video_collection,
                    size: 120,
                  )
                : VideoWidget(widget.videoFile),
          ),
          Container(
            color: Colors.blueAccent,
              child: Padding(
                padding: EdgeInsets.all(40.0),
            child: RaisedButton(
              onPressed: () {sendVideo();},
              child: Text('Next ...'),
              shape: StadiumBorder(),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
            ),
          ))
        ],
      ))),
    );
  }
  
  Future sendVideo()async{
    final getVideo = widget.videoFile;
    if(getVideo != null){
      setState(() {
        video = getVideo;
        Navigator.push(context, MaterialPageRoute(builder: (context) => TranslationPage(videoFile: video,)));
      });
    }
  }
}
