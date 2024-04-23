import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keepyoga/components/common/default_text.dart';

class BasicYogaCardLayout extends StatelessWidget {
  const BasicYogaCardLayout({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 150.h,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(107, 78, 255, 0.71),
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(
                color: const Color.fromARGB(255, 224, 220, 220),
                width: 1.w,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  left: 20.w, top: 20.h, right: 20.w, bottom: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(
                    content: "Basic Yoga",
                    fontSizeR: 16.sp,
                    colorR: Colors.white,
                    textAlignR: TextAlign.start,
                    fontWeightR: FontWeight.w400,
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: 200.w,
                    child: DefaultText(
                      content:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      fontSizeR: 14.sp,
                      colorR: Colors.white,
                      textAlignR: TextAlign.start,
                      fontWeightR: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 35.h,
            right: 20.w,
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 25.sp,
            ),
          ),
        ],
      ),
    );
  }
}
