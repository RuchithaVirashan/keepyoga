import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keepyoga/components/common/default_text.dart';
import 'package:keepyoga/screens/lesson_screen.dart';

class SessionLayout extends StatelessWidget {
  const SessionLayout({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    List<ListItem> dataList = [
      ListItem(
        imageUrl: 'assets/Image Placeholder (Copy paste here).png',
        name: 'Yoga Pilates',
        updateQuantity: 5,
        levelname: 'All Level',
        authorname: 'Sarah William',
        rate: 4.5,
      ),
      ListItem(
        imageUrl: 'assets/Images_ Ratio.png',
        name: 'Yoga Pilates',
        updateQuantity: 5,
        levelname: 'All Level',
        authorname: 'Sarah William',
        rate: 4.5,
      ),
      ListItem(
        imageUrl: 'assets/Images_ Ratio2.png',
        name: 'Yoga Pilates',
        updateQuantity: 5,
        levelname: 'All Level',
        authorname: 'Sarah William',
        rate: 4.5,
      ),
      ListItem(
        imageUrl: 'assets/Image Placeholder (Copy paste here).png',
        name: 'Yoga Pilates',
        updateQuantity: 5,
        levelname: 'All Level',
        authorname: 'Sarah William',
        rate: 4.5,
      ),
      ListItem(
        imageUrl: 'assets/Images_ Ratio.png',
        name: 'Yoga Pilates',
        updateQuantity: 5,
        levelname: 'All Level',
        authorname: 'Sarah William',
        rate: 4.5,
      ),
      ListItem(
        imageUrl: 'assets/Images_ Ratio2.png',
        name: 'Yoga Pilates',
        updateQuantity: 5,
        levelname: 'All Level',
        authorname: 'Sarah William',
        rate: 4.5,
      ),
      // Add more items as needed
    ];

    Widget buildCard(BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Color.fromARGB(255, 255, 255, 255),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 80.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.r),
                        bottomLeft: Radius.circular(5.r),
                      ),
                      child: Image.asset(
                        dataList[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DefaultText(
                          content: dataList[index].name,
                          fontSizeR: 18.sp,
                          colorR: const Color.fromRGBO(0, 0, 0, 0.8),
                          textAlignR: TextAlign.start,
                          fontWeightR: FontWeight.w800,
                        ),
                        SizedBox(height: 10.h),
                        DefaultText(
                          content: '${dataList[index].updateQuantity} lessons',
                          fontSizeR: 14.sp,
                          colorR: Colors.grey,
                          textAlignR: TextAlign.start,
                          fontWeightR: FontWeight.w600,
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.only(right: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'By ${dataList[index].authorname}',
                                style: TextStyle(fontSize: 10.sp),
                              ),
                              SizedBox(width: 10.w),
                              Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Colors.grey,
                                    size: 8.sp,
                                  ),
                                  Text(
                                    dataList[index].levelname,
                                    style: TextStyle(fontSize: 10.sp),
                                  ),
                                ],
                              ),
                              SizedBox(width: 10.w),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 10.sp,
                                  ),
                                  Text(
                                    '${dataList[index].rate}',
                                    style: TextStyle(fontSize: 10.sp),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: DefaultText(
                content: 'Top Sessions',
                fontSizeR: 24.sp,
                colorR: Colors.black,
                textAlignR: TextAlign.start,
                fontWeightR: FontWeight.w900,
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              itemCount: dataList.length,
              itemBuilder: (context, index) {
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
                        pageBuilder: (_, __, ___) => const LessonScreen(),
                      ),
                    );
                  },
                  child: buildCard(context, index),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.0,
                crossAxisSpacing: 2.w,
                mainAxisSpacing: 2.h,
                mainAxisExtent: 150.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItem {
  final String imageUrl;
  final String name;
  final int updateQuantity;
  final String levelname;
  final String authorname;
  final double rate;

  ListItem(
      {required this.imageUrl,
      required this.name,
      required this.updateQuantity,
      required this.levelname,
      required this.authorname,
      required this.rate});
}
