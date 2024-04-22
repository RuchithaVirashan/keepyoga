import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keepyoga/screens/registration_screen.dart';

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 76.h),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.w, right: 10.w),
                        child: Column(
                          children: [
                            DefaultText(
                              colorR: const Color(0xFFAFBCCB),
                              content: 'keepyoga',
                              fontSizeR: 24.sp,
                              fontWeightR: FontWeight.w600,
                              textAlignR: TextAlign.center,
                            ),
                            DefaultText(
                              colorR: const Color(0xFF090A0A),
                              content: 'Practice yoga whenever you want.',
                              fontSizeR: 32.sp,
                              fontWeightR: FontWeight.w800,
                              textAlignR: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 10.w, right: 10.w, bottom: 20.h),
                    child: Column(
                      children: [
                        Center(
                          child: ButtonWidget(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 300),
                                  transitionsBuilder:
                                      (context, animation, _, child) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },
                                  pageBuilder: (_, __, ___) =>
                                      const RegistrationScreen(),
                                ),
                              );
                            },
                            minHeight: 48.h,
                            buttonName: 'Get started',
                            textColor: const Color(0xFF090A0A),
                            buttonColor: const Color(0xFFFFFFFF),
                            radius: 48.r,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
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
