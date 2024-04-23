import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keepyoga/components/lesson/lesson_card.dart';

import '../../components/common/default_text.dart';

class LessonBottomSheet extends StatefulWidget {
  const LessonBottomSheet({super.key});

  @override
  State<LessonBottomSheet> createState() => _LessonBottomSheetState();
}

class _LessonBottomSheetState extends State<LessonBottomSheet> {
  final int cardCount = 5;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 438 / MediaQuery.of(context).size.height,
      minChildSize: 238 / MediaQuery.of(context).size.height,
      maxChildSize: 638 / MediaQuery.of(context).size.height,
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
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFCDCFD0),
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    ),
                    height: 5.h,
                    width: 48.w,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
              SliverAppBar(
                stretchTriggerOffset: 438.h,
                title: DefaultText(
                  colorR: const Color(0xFF161719),
                  content: 'Yoga Pilates Full Body',
                  fontSizeR: 24.sp,
                  fontWeightR: FontWeight.w700,
                  textAlignR: TextAlign.start,
                ),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: DefaultText(
                      colorR: const Color(0xFF6B4EFF),
                      content: '$cardCount Lessons',
                      fontSizeR: 12.sp,
                      fontWeightR: FontWeight.w400,
                      textAlignR: TextAlign.start,
                    ),
                  ),
                ],
                primary: false,
                pinned: true,
                centerTitle: false,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return LessonCard(index: index);
                  },
                  childCount: cardCount,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
