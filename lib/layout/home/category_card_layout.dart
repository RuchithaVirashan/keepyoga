// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keepyoga/components/common/default_text.dart';

class CatergoryCardLayout extends StatefulWidget {
  const CatergoryCardLayout({
    super.key,
  });

  @override
  State<CatergoryCardLayout> createState() => _CatergoryCardLayoutState();
}

class _CatergoryCardLayoutState extends State<CatergoryCardLayout> {
  String loadingStatus = '';
  List<String> values = [];
  String firstvalues = '';
  bool isCardSelected = false;
  List<ListItem> dataList = [
    ListItem(
      imageUrl: 'assets/Image Placeholder (Copy paste here).png',
      name: 'Full Body',
      backgroundColor: Colors.red,
    ),
    ListItem(
      imageUrl: 'assets/Images_ Ratio.png',
      name: 'Upper Body',
      backgroundColor: Colors.blue,
    ),
    ListItem(
      imageUrl: 'assets/Images_ Ratio2.png',
      name: 'Low Body',
      backgroundColor: Colors.green,
    ),
    ListItem(
      imageUrl: 'assets/Image Placeholder (Copy paste here).png',
      name: 'Full Body',
      backgroundColor: Colors.red,
    ),
    ListItem(
      imageUrl: 'assets/Images_ Ratio.png',
      name: 'Upper Body',
      backgroundColor: Colors.blue,
    ),
    ListItem(
      imageUrl: 'assets/Images_ Ratio2.png',
      name: 'Low Body',
      backgroundColor: Colors.green,
    ),
    // Add more items as needed
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    Widget buildCard(BuildContext context, int index) => Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                dataList[index].imageUrl,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
              child: DefaultText(
                content: dataList[index].name,
                fontSizeR: 14.sp,
                colorR: const Color.fromRGBO(0, 0, 0, 0.8),
                textAlignR: TextAlign.start,
                fontWeightR: FontWeight.w700,
              ),
            ),
          ],
        );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: SizedBox(
        height: 115.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: dataList.length,
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 5.w,
            );
          },
          itemBuilder: (context, index) {
            return buildCard(context, index);
          },
        ),
      ),
    );
  }
}

class ListItem {
  final String imageUrl;
  final String name;
  final Color backgroundColor;

  ListItem({
    required this.imageUrl,
    required this.name,
    required this.backgroundColor,
  });
}
