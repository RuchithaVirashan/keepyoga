import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({Key? key}) : super(key: key);

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
          DraggableScrollableSheet(
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r)),
                          ),
                          height: 5.h,
                          width: 48.w,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
                    SliverAppBar(
                      stretchTriggerOffset: 438.h,
                      title:
                          Text('My App', style: TextStyle(color: Colors.black)),
                      primary: false,
                      pinned: true,
                      centerTitle: false,
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return ListTile(
                            title: Text('Item $index'),
                          );
                        },
                        childCount: 50,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
