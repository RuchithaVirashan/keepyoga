// import 'dart:io';

// import 'package:audio_waveforms/audio_waveforms.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:path_provider/path_provider.dart';

// class PlayerLayout extends StatefulWidget {
//   const PlayerLayout({super.key});

//   @override
//   State<PlayerLayout> createState() => _PlayerLayoutState();
// }

// class _PlayerLayoutState extends State<PlayerLayout> {
//   String? path;
//   String? musicFile;
//   bool isLoading = true;
//   late Directory appDirectory;
//   late final PlayerController playerController;

//   @override
//   void initState() {
//     super.initState();
//     _getDir();
//     playerController = PlayerController();
//   }

//   void _getDir() async {
//     appDirectory = await getApplicationDocumentsDirectory();
//     path = "${appDirectory.path}/assets/skankin-rhythm-jubilee-203680.mp3";
//     isLoading = false;
//     setState(() {});
//   }

//   void _playandPause() async {
//     playerController.playerState == PlayerState.playing
//         ? await playerController.pausePlayer()
//         : await playerController.startPlayer(finishMode: FinishMode.loop);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     playerController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AudioFileWaveforms(
//       size: Size(ScreenUtil().scaleWidth * 0.6, 40.h),
//       playerController: playerController,
//       // enableSeekGesture: true,
//       // density: 1.5,
//       playerWaveStyle: const PlayerWaveStyle(
//         scaleFactor: 0.8,
//         fixedWaveColor: Colors.white30,
//         liveWaveColor: Colors.white,
//         waveCap: StrokeCap.butt,
//       ),
//     );
//   }
// }
