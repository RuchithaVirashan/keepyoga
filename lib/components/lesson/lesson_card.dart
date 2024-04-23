import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../screens/lesson_view_screen.dart';
import '../common/default_text.dart';

class LessonCard extends StatefulWidget {
  final int index;
  const LessonCard({
    super.key,
    required this.index,
  });

  @override
  State<LessonCard> createState() => _LessonCardState();
}

class _LessonCardState extends State<LessonCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
            pageBuilder: (_, __, ___) => LessonViewScreen(
              imageUrl: 'assets/Image_lesson.png',
              desc:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              index: widget.index,
            ),
          ),
        );
      },
      child: Card(
        surfaceTintColor: Colors.white,
        child: ListTile(
          title: DefaultText(
            colorR: const Color(0xFF090A0A),
            content: widget.index < 9
                ? 'Lesson 0${widget.index + 1}'
                : 'Lesson ${widget.index + 1}',
            fontSizeR: 16.sp,
            fontWeightR: FontWeight.w400,
            textAlignR: TextAlign.start,
          ),
          subtitle: DefaultText(
            colorR: const Color(0xFF7B7F82),
            content: 'Lorem Ipsum is simply dummy text of',
            fontSizeR: 13.sp,
            fontWeightR: FontWeight.w400,
            textAlignR: TextAlign.start,
          ),
          trailing: Icon(
            Icons.play_circle_fill,
            size: 27.sp,
          ),
          leading: CircleAvatar(
            child: ClipOval(
              child: Image.asset(
                "assets/Avatar.png",
                fit: BoxFit.cover,
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
