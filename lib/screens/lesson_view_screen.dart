import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keepyoga/components/common/back_button.dart';
import 'package:keepyoga/components/lesson/lesson_close_button.dart';
import 'package:keepyoga/layout/lesson/bottom_sheet_layout.dart';
import 'package:keepyoga/layout/lesson/bottom_sheet_lesson_view_layout.dart';

class LessonViewScreen extends StatelessWidget {
  final String imageUrl;
  final int index;
  final String desc;

  const LessonViewScreen(
      {super.key,
      required this.imageUrl,
      required this.index,
      required this.desc});

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
          Positioned(
            bottom: 350.h,
            left: 20.w,
            right: 80.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lesson 0${index + 1}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "$desc",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    overflow: TextOverflow.fade
                  ),
                ),
              ],
            ),
          ),
          const LessonViewBottomSheet(),
        ],
      ),
    );
  }
}
