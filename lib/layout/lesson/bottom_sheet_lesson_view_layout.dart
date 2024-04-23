import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../components/lesson/player_layout.dart';

class LessonViewBottomSheet extends StatefulWidget {
  const LessonViewBottomSheet({super.key});

  @override
  State<LessonViewBottomSheet> createState() => _LessonViewBottomSheetState();
}

class _LessonViewBottomSheetState extends State<LessonViewBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 338 / MediaQuery.of(context).size.height,
      minChildSize: 238 / MediaQuery.of(context).size.height,
      maxChildSize: 338 / MediaQuery.of(context).size.height,
      builder: (BuildContext context, scrollController) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
          ),
          child: PlayerLayout(),
        );
      },
    );
  }
}