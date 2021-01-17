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
      appBar: AppBar(
        title: Text('Translation'),
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
                child: Text('คำแปล'),
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