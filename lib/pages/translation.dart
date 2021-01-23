import 'dart:io';
import 'package:flutter/material.dart';
import 'package:th_signlang/widget/video_widget.dart';

class TranslationPage extends StatefulWidget {
  final File videoFile;
  TranslationPage({Key key, this.videoFile}) : super(key: key);

  @override
  _TranslationPageState createState() => _TranslationPageState();
}

class _TranslationPageState extends State<TranslationPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(54, 54, 54, 100),
      appBar: AppBar(
        title: Text('Translation'),
        // backgroundColor: Color.fromRGBO(251, 188, 27, 100),
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: <Widget> [
              Container(

                child: Padding(
                  padding: EdgeInsets.all(10.0),
                child: widget.videoFile == null ? Icon(Icons.video_collection,size: 120,)
                :VideoWidget((widget.videoFile)),
    ) ),
              Container(

                child: Text('hihihihi'),
              )
            ],
          ),
        ),
      )
      );
  }

  // Future videoResult(MediaSource source) async {
  //   setState(() {
  //     this.source = source;
  //     this.fileMedia = null;
  //   });
  //
  //   Navigator.of(context).pop(source);
  //
  // }
}