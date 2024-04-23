import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BackAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xFFFFFFFF),
            blurRadius: 1,
            offset: Offset(0, 0.50),
            spreadRadius: 0,
          )
        ],
      ),
      child: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        leading: Container(),
        elevation: 0,
        actions: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.w, top: 12.h),
                  child: IconButton(
                    icon: Icon(
                      Icons.navigate_before,
                      color: const Color(0xFF090A0A),
                      size: 30.sp,
                    ),
                    splashRadius: 20.r,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
