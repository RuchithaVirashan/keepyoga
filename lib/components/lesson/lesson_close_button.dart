import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonHeaderButton extends StatelessWidget {
  const LessonHeaderButton({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Padding(
      padding: EdgeInsets.only(left: 10.w, top: 5.h),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0x203E4144),
            shape: BoxShape.circle,
            borderRadius: BorderRadius.circular(100.r)),
        child: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
