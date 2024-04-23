import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keepyoga/components/common/default_text.dart';

import '../../screens/login_screen.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50.0);

  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 18) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final greeting = getGreeting();
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: AppBar(
        backgroundColor: const Color(0xFFF8F8F8),
        leading: Container(),
        elevation: 0,
        actions: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DefaultText(
                    colorR: Colors.black,
                    content: greeting,
                    fontSizeR: 24.sp,
                    fontWeightR: FontWeight.w700,
                    textAlignR: TextAlign.start,
                  ),
                  Row(
                    children: [
                      ClipOval(
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(20.r),
                          child: Image.asset(
                            'assets/Ellipse 7.png',
                            width: 12.w,
                            height: 12.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.power_settings_new,
                          color: const Color(0xFF363062),
                          size: 40.sp,
                        ),
                        splashRadius: 20.r,
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
                              pageBuilder: (_, __, ___) => const LoginScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
