import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:th_signlang/pages/home.dart';
import 'package:http/http.dart' as http;
import 'package:th_signlang/pages/translation.dart';
import 'package:th_signlang/widget/video_widget.dart';

class ProcessingPage extends StatefulWidget {
  final File videoFile;
  final bool looping;
  // final String res ;

  ProcessingPage({Key key, this.videoFile, this.looping}) : super(key: key);

  @override
  _ProcessingPageState createState() => _ProcessingPageState();
}


class _ProcessingPageState extends State<ProcessingPage> {
  var video;
  String result;
  bool showButton = true;
  // TextEditingController textFieldController = TextEditingController();
  // String uriAPI = 'http://192.46.230.251:8000/upload';

  void hideButton() {
    setState(() {
      showButton = !showButton;
    });
  }

  Future sendVideo() async {
    final getVideo = widget.videoFile;
    if (getVideo != null) {
      setState(() {
        video = getVideo;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) {
                  postVideo(video);
                  return TranslationPage(videoFile: video,res: result);
                }
            )
        );
      });
    }
  }

  postVideo(File file) async {
    print("File.toString(): ${file.toString()}");
    // final response = await http.post(
    //   Uri.http('192.46.230.251:8000', 'upload'),
    //   // headers:{ "Content-Type":"multipart/form-data" } ,
    //   body: {'file': file.readAsBytes()},
    //   encoding: Encoding.getByName("utf-8"),
    // );

    var request = http.MultipartRequest("POST", Uri.parse('http://192.46.230.251:8000/upload2'));
    print("init request");

    var multipartFile = await http.MultipartFile.fromPath('file', file.path);
    // var multipartFile = http.MultipartFile.fromBytes('file', await file.readAsBytes());
    print("init multipartFile");

    request.files.add(multipartFile);
    print("request: files added");

    var response = await request.send();
    print("request sent");
    var output = await response.stream.bytesToString();
    // print(" response.stream");

    if (response.statusCode == 200) {
      print(response.statusCode);
      print("yippee");
      Map<String, dynamic> result_json = jsonDecode(output);
      print(result_json['result']);

      result = result_json['result'];
    } else {
      print(response.statusCode);
      throw Exception('Failed');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    postVideo(widget.videoFile);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(54, 54, 54, 100),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Processing '),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        // backgroundColor: Color.fromRGBO(251, 188, 27, 100),
      ),
      body: SafeArea(
          child: Center(
              child: ListView(
                children: <Widget>[
                Container(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(80, 20, 80, 25),
                    child: widget.videoFile == null
                  ? Icon(
                      Icons.video_collection,
                      size: 120,
                    )
                  : VideoWidget(widget.videoFile),
            ),
          ),
          //       Container(
          //         child: SizedBox(
          //           height: 10,
          //            width: 10,
          //           child: LinearProgressIndicator(
          //             backgroundColor: Colors.grey,
          //             minHeight: 4,
          //     ),
          //   ),
          // ),
                

                // --------------------- button for go to next page
                Container(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(100, 10, 100, 0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.40,
                        child: RaisedButton(
                          shape: StadiumBorder(),
                          onPressed: () {
                            sendVideo();
                            },
                          child: Text('Upload'),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                        )

                      ),
                    )
              // )
                ),
        ],
      ))),
    );
  }
}
