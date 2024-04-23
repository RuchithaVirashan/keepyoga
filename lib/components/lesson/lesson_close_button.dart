import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../screens/main_screen.dart';

class LessonCloseButton extends StatelessWidget {
  const LessonCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(100.r)),
      child: IconButton(
        icon: Icon(
          Icons.close,
          color: Colors.black,
          size: 24.sp,
        ),
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 300),
              transitionsBuilder: (context, animation, _, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              pageBuilder: (_, __, ___) => const MainScreen(
                selectedIndex: 0,
              ),
            ),
          );
        },
      ),
    );
  }
}
