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
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.white, Colors.orangeAccent,Color.fromRGBO(251, 188, 27, 100)],
          begin: Alignment.topCenter,end: Alignment.bottomCenter)),
          child: Center(
            // height: screenHeight / 3,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  child: Image.asset(
                    'lib/assets/logo3.jpeg',
                    width: 200.0,
                    height: 200.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                const SizedBox(height: 24),
                RaisedButton(
                  child: Text(
                    'Camera',
                  ),
                  shape: StadiumBorder(),
                  // onPressed: () => videoMedia(context),
                  onPressed: (){videoMedia();},
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                ),
                const SizedBox(height: 12),
                RaisedButton(
                  child: Text('Gallery'),
                  shape: StadiumBorder(),
                  // onPressed: () => pickGalleryMedia(context),
                  onPressed: (){galleryMedia();},
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future videoMedia()async{
    final getVideo = await ImagePicker.pickVideo(source: ImageSource.camera); // final getMedia = ImagePicker().getVideo;

    if(getVideo != null){
      setState(() {
        videoFile = getVideo;
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProcessingPage(videoFile: videoFile)));
      });
    }
  }
  Future galleryMedia()async{
    File getVideo = await ImagePicker.pickVideo(source: ImageSource.gallery);

    if(getVideo != null){
      setState(() {
        videoFile = getVideo;
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProcessingPage(videoFile: videoFile,)));
      });
    }
  }


}
