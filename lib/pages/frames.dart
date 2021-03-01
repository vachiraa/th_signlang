//
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:export_video_frame/export_video_frame.dart';
//
//
// class FramesPage extends StatefulWidget {
//   final File videoFile;
//   final List<Image> images;
//
//   FramesPage({Key key, this.videoFile,this.images}) : super(key: key);
//
//   @override
//   _FramesPageState createState() => _FramesPageState();
// }
//
// class ImageItem extends StatelessWidget {
//   ImageItem({this.image}) : super(key: ObjectKey(image));
//   final Image image;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: image
//     );
//   }
// }
//
// class _FramesPageState extends State<FramesPage> {
//   //images<Image> showFrame = [];
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Export Image"),
//       ),
//       body: Container(
//         padding: EdgeInsets.zero,
//         child: Column(
//           children: <Widget>[
//             Expanded(
//               flex: 1,
//               child:
//               GridView.extent(
//                   maxCrossAxisExtent: 400,
//                   childAspectRatio: 1.0,
//                   padding: const EdgeInsets.all(4),
//                   mainAxisSpacing: 4,
//                   crossAxisSpacing: 4,
//                   children: widget.images.map((image) => ImageItem(image:image)).toList() => [Container()]
//               ),
//             ),
//
//
//
//           ],
//         ),
//       ),
//     );
//   }
//   Future _getImages() async {
//     var file = widget.videoFile;
//     var images = await ExportVideoFrame.exportImage(file.path, 10, 0);
//     var result = images.map((file) => Image.file(file)).toList();
//   }
// }