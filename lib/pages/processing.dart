// import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:th_signlang/pages/home.dart';
import 'package:th_signlang/pages/translation.dart';
import 'package:th_signlang/widget/video_widget.dart';

class ProcessingPage extends StatefulWidget {
  final File videoFile;
  final bool looping;
  final List<Image> frames = [];

  ProcessingPage({Key key, this.videoFile,this.looping}) : super(key: key);

  @override
  _ProcessingPageState createState() => _ProcessingPageState();
}

class ImageItem extends StatelessWidget {
  ImageItem({this.image}) : super(key: ObjectKey(image));
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: image
    );
  }
}

class _ProcessingPageState extends State<ProcessingPage> {
  var video;


  Future sendVideo()async{
    final getVideo = widget.videoFile;
    if(getVideo != null){
      setState(() {
        video = getVideo;
        Navigator.push(context, MaterialPageRoute(builder: (context) => TranslationPage(videoFile: video,)));
        // Navigator.push(context, MaterialPageRoute(builder: (context) => FramesPage( videoFile: video,)));
      });
    }
  }

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
                  // Container(
                  //   child: Padding(
                  //       padding: const EdgeInsets.all(4),
                  //       mainAxisSpacing: 1,
                  //       crossAxisSpacing: 1,
                  //       children:  widget.frames.length > 0 ?  widget.frames.map((image) => ImageItem(image:image)).toList()  : [Container()]
                  //   ),
                  //
                  //
                  //
                  //   ),
                Container(
                   child: Padding( padding: EdgeInsets.fromLTRB(60, 40, 60, 20),
                     child: widget.videoFile == null ?
                     Icon( Icons.video_collection, size: 120,)
                     : VideoWidget(widget.videoFile),
                  ),),
                Container(
                    child: SizedBox(
                      height: 10,
                       width: 10,
                       child: LinearProgressIndicator( backgroundColor: Colors.grey,minHeight: 4,)  ,
                ),),
                Container(
                  child:Padding(
                    padding: EdgeInsets.fromLTRB(100, 10, 100, 0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width *  0.40,
                      child: RaisedButton(
                        shape: StadiumBorder(),
                        onPressed: () {sendVideo();},
                        child: Text('Next ...'),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
            ),),
                  )
          // )
                ),
        ],
      ))),
    );
  }


}
