import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:th_signlang/pages/home.dart';
import 'package:http/http.dart' as http;
import 'package:th_signlang/widget/video_widget.dart';

class TranslationPage extends StatefulWidget {
  final File videoFile;
  final String res;
  TranslationPage({Key key, this.videoFile,this.res}) : super(key: key);

  @override
  _TranslationPageState createState() => _TranslationPageState();
}

class _TranslationPageState extends State<TranslationPage> {
  String word;
  // getString() async{
  //   Map<String, dynamic> res = jsonDecode(jsonString);
  //   print('${res['result']}!');
  //
  //   if (response.statusCode == 200) {
  //     print("yippee");
  //     print(response.statusCode);
  //   } else {
  //     print(response.statusCode);
  //     throw Exception('Failed');
  //   }
  // }

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
        ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  // width: MediaQuery.of(context).size.width *  0.1,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(28, 10, 28, 10),
                child: widget.videoFile == null ? Icon(Icons.video_collection,size: 120,)
                :VideoWidget((widget.videoFile)),
    ) ),
              Container(
                child: Center(
                   child: SizedBox(
                     height: MediaQuery.of(context).size.height * 0.08,
                     width: MediaQuery.of(context).size.width *  0.80,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),),
                          color: Colors.deepOrange,
                          child: Center(child: Text(word, style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold,))),),
                    )
                )
              ),
            ],
          ),
        ),
      )
      );
  }

}