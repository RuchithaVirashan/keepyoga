import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keepyoga/components/common/back_button.dart';

import '../components/lesson/lesson_close_button.dart';
import '../layout/lesson/bottom_sheet_layout.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/Image_lesson.png",
            fit: BoxFit.cover,
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().screenHeight,
          ),
          Padding(
            padding: EdgeInsets.only(left: 18.w, top: 48.h),
            child: const CommonBackButton(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(top: 60.h, right: 24.w),
              child: const LessonCloseButton(),
            ),
          ),
          const LessonBottomSheet(),
        ],
      ),
    );
  }
}
