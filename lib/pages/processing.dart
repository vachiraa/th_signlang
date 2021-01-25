// import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:th_signlang/pages/home.dart';
import 'package:th_signlang/pages/translation.dart';
import 'package:th_signlang/widget/video_widget.dart';

class ProcessingPage extends StatefulWidget {
  final File videoFile;
  final bool looping;

  ProcessingPage({Key key, this.videoFile,this.looping}) : super(key: key);

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
        centerTitle: true,
          title: Text('Processing '),
        automaticallyImplyLeading: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        ),
        // backgroundColor: Color.fromRGBO(251, 188, 27, 100),
      ),
      body: SafeArea(
          child: Center(
              child: ListView(
                children: <Widget>[
                Container(
                   child: Padding( padding: EdgeInsets.fromLTRB(60, 40, 60, 20),
                     child: widget.videoFile == null ?
                     Icon( Icons.video_collection, size: 120,)
                     : VideoWidget(widget.videoFile),
                  ),),
                Container(
                  child:Padding(
                    padding: EdgeInsets.fromLTRB(100, 10, 100, 0),
                    child: SizedBox(
                      child: RaisedButton(
                        shape: StadiumBorder(),
                        onPressed: () {sendVideo();},
                        child: Text('Next ...'),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
            ),),
                  )
          // )
                )
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
