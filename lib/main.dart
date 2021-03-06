import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:flutter/material.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  IjkMediaController controller = IjkMediaController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.videocam),
              onPressed: null,
            ),
          ],
        ),
        body: Container(
          // width: MediaQuery.of(context).size.width,
          // height: 400,
          child: ListView(children: <Widget>[
            buildIjkPlayer(),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () async {
            await controller.setNetworkDataSource(
                'rtmp://23.225.228.227/live/hall',
                // 'rtmp://172.16.100.245/live1',
                // 'https://www.sample-videos.com/video123/flv/720/big_buck_bunny_720p_10mb.flv',
//              "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4",
                // 'http://184.72.239.149/vod/smil:BigBuckBunny.smil/playlist.m3u8',
                // "file:///sdcard/Download/Sample1.mp4",
                autoPlay: true);
            print("set data source success");
            // controller.playOrPause();
          },
        ),
      ),
    );
  }

  Widget buildIjkPlayer() {
    return Container(
      // height: 400, // 这里随意
      child: IjkPlayer(
        mediaController: controller,
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:gplayer/gplayer.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   GPlayer player;
//   @override
//   void initState() {
//     super.initState();
//     //1.create & init player
//     player = GPlayer(uri: 'rtmp://23.225.228.227/live/hall')
//       ..init()
//       ..addListener((_) {
//         //update control button out of player
//         setState(() {});
//       });
//   }

//   @override
//   void dispose() {
//     player?.dispose(); //2.release player
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Video Demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('GPlayer'),
//         ),
//         body: player.display, //3.put the player display in Widget tree
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             setState(() {
//               player.isPlaying ? player.pause() : player.start();
//             });
//           },
//           child: Icon(
//             player.isPlaying ? Icons.pause : Icons.play_arrow,
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'dart:async';

// import 'package:flutter_rtmp/flutter_rtmp.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   RtmpManager _manager;
//   int count = 0;
//   Timer _timer;

//   @override
//   void initState() {
//     super.initState();
//     _manager = RtmpManager(onCreated: () {
//       print("--- view did created ---");
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           body: Center(
//         child: SafeArea(
//           child: Stack(
//             fit: StackFit.expand,
//             children: <Widget>[
//               RtmpView(
//                 manager: _manager,
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 20),
//                 alignment: Alignment.topLeft,
//                 child: Row(
//                   children: <Widget>[
//                     IconButton(
//                       icon: Icon(Icons.play_arrow),
//                       onPressed: () {
//                         _manager.living(url: "rtmp://23.225.228.227/live/hall");
//                         if (_timer == null)
//                           _timer ??= Timer.periodic(Duration(seconds: 1), (_) {
//                             setState(() {
//                               count += 1;
//                             });
//                           });
//                       },
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.pause),
//                       onPressed: () {
//                         _manager.pauseLive();
//                         if (_timer != null) {
//                           _timer.cancel();
//                           _timer = null;
//                         }
//                         ;
//                       },
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.switch_camera),
//                       onPressed: () {
//                         _manager.switchCamera();
//                       },
//                     ),
//                     Container(
//                       child: Text(
//                         "${count ~/ 60}:${count % 60}",
//                         style: TextStyle(fontSize: 17, color: Colors.blue),
//                       ),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       )),
//     );
//   }
// }

// import 'dart:async';
// import 'dart:io';

// import 'package:camera_with_rtmp/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:video_player/video_player.dart';
// import 'package:wakelock/wakelock.dart';

// class CameraExampleHome extends StatefulWidget {
//   @override
//   _CameraExampleHomeState createState() {
//     return _CameraExampleHomeState();
//   }
// }

// /// Returns a suitable camera icon for [direction].
// IconData getCameraLensIcon(CameraLensDirection direction) {
//   switch (direction) {
//     case CameraLensDirection.back:
//       return Icons.camera_rear;
//     case CameraLensDirection.front:
//       return Icons.camera_front;
//     case CameraLensDirection.external:
//       return Icons.camera;
//   }
//   throw ArgumentError('Unknown lens direction');
// }

// void logError(String code, String message) =>
//     print('Error: $code\nError Message: $message');

// class _CameraExampleHomeState extends State<CameraExampleHome>
//     with WidgetsBindingObserver {
//   CameraController controller;
//   String imagePath;
//   String videoPath;
//   String url;
//   VideoPlayerController videoController;
//   VoidCallback videoPlayerListener;
//   bool enableAudio = true;
//   bool useOpenGL = true;
//   TextEditingController _textFieldController = TextEditingController(
//       text: "rtmp://23.225.228.227/live/hall");

//   Timer _timer;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     super.dispose();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     // App state changed before we got the chance to initialize.
//     if (controller == null || !controller.value.isInitialized) {
//       return;
//     }
//     if (state == AppLifecycleState.inactive) {
//       controller?.dispose();
//       if (_timer != null) {
//         _timer.cancel();
//         _timer = null;
//       }
//     } else if (state == AppLifecycleState.resumed) {
//       if (controller != null) {
//         onNewCameraSelected(controller.description);
//       }
//     }
//   }

//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         title: const Text('Camera example'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(1.0),
//                 child: Center(
//                   child: _cameraPreviewWidget(),
//                 ),
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.black,
//                 border: Border.all(
//                   color: controller != null && controller.value.isRecordingVideo
//                       ? controller.value.isStreamingVideoRtmp
//                           ? Colors.redAccent
//                           : Colors.orangeAccent
//                       : controller != null &&
//                               controller.value.isStreamingVideoRtmp
//                           ? Colors.blueAccent
//                           : Colors.grey,
//                   width: 3.0,
//                 ),
//               ),
//             ),
//           ),
//           _captureControlRowWidget(),
//           _toggleAudioWidget(),
//           Padding(
//             padding: const EdgeInsets.all(5.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 _cameraTogglesRowWidget(),
//                 _thumbnailWidget(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// Display the preview from the camera (or a message if the preview is not available).
//   Widget _cameraPreviewWidget() {
//     if (controller == null || !controller.value.isInitialized) {
//       return const Text(
//         'Tap a camera',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 24.0,
//           fontWeight: FontWeight.w900,
//         ),
//       );
//     } else {
//       return AspectRatio(
//         aspectRatio: controller.value.aspectRatio,
//         child: CameraPreview(controller),
//       );
//     }
//   }

//   /// Toggle recording audio
//   Widget _toggleAudioWidget() {
//     return Padding(
//       padding: const EdgeInsets.only(left: 25),
//       child: Row(
//         children: <Widget>[
//           const Text('Enable Audio:'),
//           Switch(
//             value: enableAudio,
//             onChanged: (bool value) {
//               enableAudio = value;
//               if (controller != null) {
//                 onNewCameraSelected(controller.description);
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   /// Display the thumbnail of the captured image or video.
//   Widget _thumbnailWidget() {
//     return Expanded(
//       child: Align(
//         alignment: Alignment.centerRight,
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             videoController == null && imagePath == null
//                 ? Container()
//                 : SizedBox(
//                     child: (videoController == null)
//                         ? Image.file(File(imagePath))
//                         : Container(
//                             child: Center(
//                               child: AspectRatio(
//                                   aspectRatio:
//                                       videoController.value.size != null
//                                           ? videoController.value.aspectRatio
//                                           : 1.0,
//                                   child: VideoPlayer(videoController)),
//                             ),
//                             decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.pink)),
//                           ),
//                     width: 64.0,
//                     height: 64.0,
//                   ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// Display the control bar with buttons to take pictures and record videos.
//   Widget _captureControlRowWidget() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       mainAxisSize: MainAxisSize.max,
//       children: <Widget>[
//         IconButton(
//           icon: const Icon(Icons.camera_alt),
//           color: Colors.blue,
//           onPressed: controller != null && controller.value.isInitialized
//               ? onTakePictureButtonPressed
//               : null,
//         ),
//         IconButton(
//           icon: const Icon(Icons.videocam),
//           color: Colors.blue,
//           onPressed: controller != null &&
//                   controller.value.isInitialized &&
//                   !controller.value.isRecordingVideo
//               ? onVideoRecordButtonPressed
//               : null,
//         ),
//         IconButton(
//           icon: const Icon(Icons.watch),
//           color: Colors.blue,
//           onPressed: controller != null &&
//                   controller.value.isInitialized &&
//                   !controller.value.isStreamingVideoRtmp
//               ? onVideoStreamingButtonPressed
//               : null,
//         ),
//         IconButton(
//           icon: controller != null && (controller.value.isRecordingPaused || controller.value.isStreamingPaused)
//               ? Icon(Icons.play_arrow)
//               : Icon(Icons.pause),
//           color: Colors.blue,
//           onPressed: controller != null &&
//                   controller.value.isInitialized &&
//                   (controller.value.isRecordingVideo ||
//                       controller.value.isStreamingVideoRtmp)
//               ? (controller != null &&
//                       (controller.value.isRecordingPaused ||
//                           controller.value.isStreamingPaused)
//                   ? onResumeButtonPressed
//                   : onPauseButtonPressed)
//               : null,
//         ),
//         IconButton(
//           icon: const Icon(Icons.stop),
//           color: Colors.red,
//           onPressed: controller != null &&
//                   controller.value.isInitialized &&
//                   (controller.value.isRecordingVideo ||
//                       controller.value.isStreamingVideoRtmp)
//               ? onStopButtonPressed
//               : null,
//         )
//       ],
//     );
//   }

//   /// Display a row of toggle to select the camera (or a message if no camera is available).
//   Widget _cameraTogglesRowWidget() {
//     final List<Widget> toggles = <Widget>[];

//     if (cameras.isEmpty) {
//       return const Text('No camera found');
//     } else {
//       for (CameraDescription cameraDescription in cameras) {
//         toggles.add(
//           SizedBox(
//             width: 90.0,
//             child: RadioListTile<CameraDescription>(
//               title: Icon(getCameraLensIcon(cameraDescription.lensDirection)),
//               groupValue: controller?.description,
//               value: cameraDescription,
//               onChanged: controller != null && controller.value.isRecordingVideo
//                   ? null
//                   : onNewCameraSelected,
//             ),
//           ),
//         );
//       }
//     }

//     return Row(children: toggles);
//   }

//   String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

//   void showInSnackBar(String message) {
//     _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
//   }

//   void onNewCameraSelected(CameraDescription cameraDescription) async {
//     if (controller != null) {
//       await controller.dispose();
//     }
//     controller = CameraController(
//       cameraDescription,
//       ResolutionPreset.medium,
//       enableAudio: enableAudio,
//       androidUseOpenGL: useOpenGL,
//     );

//     // If the controller is updated then update the UI.
//     controller.addListener(() {
//       if (mounted) setState(() {});
//       if (controller.value.hasError) {
//         showInSnackBar('Camera error ${controller.value.errorDescription}');
//         if (_timer != null) {
//           _timer.cancel();
//           _timer = null;
//         }
//         Wakelock.disable();
//       }
//     });

//     try {
//       await controller.initialize();
//     } on CameraException catch (e) {
//       _showCameraException(e);
//     }

//     if (mounted) {
//       setState(() {});
//     }
//   }

//   void onTakePictureButtonPressed() {
//     takePicture().then((String filePath) {
//       if (mounted) {
//         setState(() {
//           imagePath = filePath;
//           videoController?.dispose();
//           videoController = null;
//         });
//         if (filePath != null) showInSnackBar('Picture saved to $filePath');
//       }
//     });
//   }

//   void onVideoRecordButtonPressed() {
//     startVideoRecording().then((String filePath) {
//       if (mounted) setState(() {});
//       if (filePath != null) showInSnackBar('Saving video to $filePath');
//       Wakelock.enable();
//     });
//   }

//   void onVideoStreamingButtonPressed() {
//     startVideoStreaming().then((String url) {
//       if (mounted) setState(() {});
//       if (url != null) showInSnackBar('Streaming video to $url');
//       Wakelock.enable();
//     });
//   }

//   void onRecordingAndVideoStreamingButtonPressed() {
//     startRecordingAndVideoStreaming().then((String url) {
//       if (mounted) setState(() {});
//       if (url != null) showInSnackBar('Recording streaming video to $url');
//       Wakelock.enable();
//     });
//   }

//   void onStopButtonPressed() {
//     if (this.controller.value.isStreamingVideoRtmp) {
//       stopVideoStreaming().then((_) {
//         if (mounted) setState(() {});
//         showInSnackBar('Video streamed to: $url');
//       });
//     } else {
//       stopVideoRecording().then((_) {
//         if (mounted) setState(() {});
//         showInSnackBar('Video recorded to: $videoPath');
//       });
//     }
//     Wakelock.disable();
//   }

//   void onPauseButtonPressed() {
//     pauseVideoRecording().then((_) {
//       if (mounted) setState(() {});
//       showInSnackBar('Video recording paused');
//     });
//   }

//   void onResumeButtonPressed() {
//     resumeVideoRecording().then((_) {
//       if (mounted) setState(() {});
//       showInSnackBar('Video recording resumed');
//     });
//   }

//   void onStopStreamingButtonPressed() {
//     stopVideoStreaming().then((_) {
//       if (mounted) setState(() {});
//       showInSnackBar('Video not streaming to: $url');
//     });
//   }

//   void onPauseStreamingButtonPressed() {
//     pauseVideoStreaming().then((_) {
//       if (mounted) setState(() {});
//       showInSnackBar('Video streaming paused');
//     });
//   }

//   void onResumeStreamingButtonPressed() {
//     resumeVideoStreaming().then((_) {
//       if (mounted) setState(() {});
//       showInSnackBar('Video streaming resumed');
//     });
//   }

//   Future<String> startVideoRecording() async {
//     if (!controller.value.isInitialized) {
//       showInSnackBar('Error: select a camera first.');
//       return null;
//     }

//     final Directory extDir = await getApplicationDocumentsDirectory();
//     final String dirPath = '${extDir.path}/Movies/flutter_test';
//     await Directory(dirPath).create(recursive: true);
//     final String filePath = '$dirPath/${timestamp()}.mp4';

//     if (controller.value.isRecordingVideo) {
//       // A recording is already started, do nothing.
//       return null;
//     }

//     try {
//       videoPath = filePath;
//       await controller.startVideoRecording(filePath);
//     } on CameraException catch (e) {
//       _showCameraException(e);
//       return null;
//     }
//     return filePath;
//   }

//   Future<void> stopVideoRecording() async {
//     if (!controller.value.isRecordingVideo) {
//       return null;
//     }

//     try {
//       await controller.stopVideoRecording();
//     } on CameraException catch (e) {
//       _showCameraException(e);
//       return null;
//     }

//     await _startVideoPlayer();
//   }

//   Future<void> pauseVideoRecording() async {
//     try {
//      if (controller.value.isRecordingVideo) {
//        await controller.pauseVideoRecording();
//      }
//      if (controller.value.isStreamingVideoRtmp) {
//        await controller.pauseVideoStreaming();
//      }
//     } on CameraException catch (e) {
//       _showCameraException(e);
//       rethrow;
//     }
//   }

//   Future<void> resumeVideoRecording() async {
//     try {
//      if (controller.value.isRecordingVideo) {
//        await controller.resumeVideoRecording();
//      }
//      if (controller.value.isStreamingVideoRtmp) {
//        await controller.resumeVideoStreaming();
//      }
//     } on CameraException catch (e) {
//       _showCameraException(e);
//       rethrow;
//     }
//   }

//   Future<String> _getUrl() async {
//     // Open up a dialog for the url
//     String result = _textFieldController.text;

//     return await showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Url to Stream to'),
//             content: TextField(
//               controller: _textFieldController,
//               decoration: InputDecoration(hintText: "Url to Stream to"),
//               onChanged: (String str) => result = str,
//             ),
//             actions: <Widget>[
//               new FlatButton(
//                 child: new Text(
//                     MaterialLocalizations.of(context).cancelButtonLabel),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//               FlatButton(
//                 child: Text(MaterialLocalizations.of(context).okButtonLabel),
//                 onPressed: () {
//                   Navigator.pop(context, result);
//                 },
//               )
//             ],
//           );
//         });
//   }

//   Future<String> startRecordingAndVideoStreaming() async {
//     if (!controller.value.isInitialized) {
//       showInSnackBar('Error: select a camera first.');
//       return null;
//     }

//     if (controller.value.isStreamingVideoRtmp ||
//         controller.value.isStreamingVideoRtmp) {
//       return null;
//     }

//     String myUrl = await _getUrl();

//     final Directory extDir = await getApplicationDocumentsDirectory();
//     final String dirPath = '${extDir.path}/Movies/flutter_test';
//     await Directory(dirPath).create(recursive: true);
//     final String filePath = '$dirPath/${timestamp()}.mp4';

//     try {
//       if (_timer != null) {
//         _timer.cancel();
//         _timer = null;
//       }
//       url = myUrl;
//       videoPath = filePath;
//       await controller.startVideoRecordingAndStreaming(videoPath, url);
//       _timer = Timer.periodic(Duration(seconds: 1), (timer) async {
//         var stats = await controller.getStreamStatistics();
//         print(stats);
//       });
//     } on CameraException catch (e) {
//       _showCameraException(e);
//       return null;
//     }
//     return url;
//   }

//   Future<String> startVideoStreaming() async {
//     if (!controller.value.isInitialized) {
//       showInSnackBar('Error: select a camera first.');
//       return null;
//     }

//     if (controller.value.isStreamingVideoRtmp) {
//       return null;
//     }

//     // Open up a dialog for the url
//     String myUrl = await _getUrl();

//     try {
//       if (_timer != null) {
//         _timer.cancel();
//         _timer = null;
//       }
//       url = myUrl;
//       await controller.startVideoStreaming(url);
//       _timer = Timer.periodic(Duration(seconds: 1), (timer) async {
//         var stats = await controller.getStreamStatistics();
//         print(stats);
//       });
//     } on CameraException catch (e) {
//       _showCameraException(e);
//       return null;
//     }
//     return url;
//   }

//   Future<void> stopVideoStreaming() async {
//     if (!controller.value.isStreamingVideoRtmp) {
//       return null;
//     }

//     try {
//       await controller.stopVideoStreaming();
//       if (_timer != null) {
//         _timer.cancel();
//         _timer = null;
//       }
//     } on CameraException catch (e) {
//       _showCameraException(e);
//       return null;
//     }
//   }

//   Future<void> pauseVideoStreaming() async {
//     if (!controller.value.isStreamingVideoRtmp) {
//       return null;
//     }

//     try {
//       await controller.pauseVideoStreaming();
//     } on CameraException catch (e) {
//       _showCameraException(e);
//       rethrow;
//     }
//   }

//   Future<void> resumeVideoStreaming() async {
//     if (!controller.value.isStreamingVideoRtmp) {
//       return null;
//     }

//     try {
//       await controller.resumeVideoStreaming();
//     } on CameraException catch (e) {
//       _showCameraException(e);
//       rethrow;
//     }
//   }

//   Future<void> _startVideoPlayer() async {
//     final VideoPlayerController vcontroller =
//         VideoPlayerController.file(File(videoPath));
//     videoPlayerListener = () {
//       if (videoController != null && videoController.value.size != null) {
//         // Refreshing the state to update video player with the correct ratio.
//         if (mounted) setState(() {});
//         videoController.removeListener(videoPlayerListener);
//       }
//     };
//     vcontroller.addListener(videoPlayerListener);
//     await vcontroller.setLooping(true);
//     await vcontroller.initialize();
//     await videoController?.dispose();
//     if (mounted) {
//       setState(() {
//         imagePath = null;
//         videoController = vcontroller;
//       });
//     }
//     await vcontroller.play();
//   }

//   Future<String> takePicture() async {
//     if (!controller.value.isInitialized) {
//       showInSnackBar('Error: select a camera first.');
//       return null;
//     }
//     final Directory extDir = await getApplicationDocumentsDirectory();
//     final String dirPath = '${extDir.path}/Pictures/flutter_test';
//     await Directory(dirPath).create(recursive: true);
//     final String filePath = '$dirPath/${timestamp()}.jpg';

//     if (controller.value.isTakingPicture) {
//       // A capture is already pending, do nothing.
//       return null;
//     }

//     try {
//       await controller.takePicture(filePath);
//     } on CameraException catch (e) {
//       _showCameraException(e);
//       return null;
//     }
//     return filePath;
//   }

//   void _showCameraException(CameraException e) {
//     logError(e.code, e.description);
//     showInSnackBar('Error: ${e.code}\n${e.description}');
//   }
// }

// class CameraApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: CameraExampleHome(),
//     );
//   }
// }

// List<CameraDescription> cameras = [];

// Future<void> main() async {
//   // Fetch the available cameras before initializing the app.
//   try {
//     WidgetsFlutterBinding.ensureInitialized();
//     cameras = await availableCameras();
//   } on CameraException catch (e) {
//     logError(e.code, e.description);
//   }
//   runApp(CameraApp());
// }
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video Player'),
//       ),
//       body: ListView(
//         children: <Widget>[

//           ChewieListItem(
//             videoPlayerController: VideoPlayerController.network(
//               'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
//             ),
//           ),
//           // ChewieListItem(
//           //   // This URL doesn't exist - will display an error
//           //   videoPlayerController: VideoPlayerController.network(
//           //     'rtmp://23.225.228.227/live/hall',
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
