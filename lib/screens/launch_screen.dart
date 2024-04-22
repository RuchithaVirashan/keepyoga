import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/common/button.dart';
import '../components/common/default_text.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFDAE2EB),
          height: ScreenUtil().screenHeight,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 145.h),
                child: Image.asset(
                  "assets/Image.png",
                  fit: BoxFit.cover,
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().screenHeight,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 76.h),
                    child: const Center(
                      child: DefaultText(
                        colorR: Color(0xFFAFBCCB),
                        content: 'keepyoga',
                        fontSizeR: 24,
                        fontWeightR: FontWeight.w600,
                        textAlignR: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 24.h,
                      left: 24.w,
                      right: 24.w,
                    ),
                    child: const Center(
                      child: DefaultText(
                        colorR: Color(0xFF090A0A),
                        content: 'Practice yoga whenever you want.',
                        fontSizeR: 32,
                        fontWeightR: FontWeight.w700,
                        textAlignR: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 490.h,
                      left: 24.w,
                      right: 24.w,
                    ),
                    child: Center(
                      child: ButtonWidget(
                        onPressed: () {},
                        minHeight: 48.h,
                        buttonName: 'Get started',
                        textColor: const Color(0xFF090A0A),
                        buttonColor: const Color(0xFFFFFFFF),
                        radius: 48.r,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.h,
                      left: 24.w,
                      right: 24.w,
                    ),
                    child: Center(
                      child: ButtonWidget(
                        onPressed: () {},
                        minHeight: 48.h,
                        buttonName: 'Log in',
                        textColor: const Color(0xFFFFFFFF),
                        buttonColor: const Color(0xFF6B4EFF),
                        radius: 48.r,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
