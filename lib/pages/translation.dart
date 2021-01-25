import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:th_signlang/pages/home.dart';
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
        centerTitle: true,
        title: Text('Translation'),
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
            children: <Widget> [
              Container(

                child: Padding(
                  padding: EdgeInsets.fromLTRB(40, 5, 40, 15),
                child: widget.videoFile == null ? Icon(Icons.video_collection,size: 120,)
                :VideoWidget((widget.videoFile)),
    ) ),
              Container(
                child: Center(
                   child: SizedBox(
                      width: 320.0,
                      height: 50.0,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),),
                          color: Colors.deepOrange,
                          child: Center(child: Text('Hello World!', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,))),),
                    )
                )
              )
            ],
          ),
        ),
      )
      );
  }

}