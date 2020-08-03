// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_rtmp/flutter_rtmp.dart';

// class FluRTMP extends StatefulWidget {
//   @override
//   _FluRTMPState createState() => _FluRTMPState();
// }

// class _FluRTMPState extends State<FluRTMP> {
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
