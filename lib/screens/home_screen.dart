import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keepyoga/layout/home/basic_yoga_card_layout.dart';
import 'package:keepyoga/layout/home/category_card_layout.dart';
import 'package:keepyoga/layout/home/session_layout.dart';
import '../components/home/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 2.w,
                top: 2.h,
                right: 2.w,
              ),
            ),
            const CatergoryCardLayout(),
            Padding(
              padding: EdgeInsets.only(
                left: 2.w,
                top: 8.h,
                right: 2.w,
              ),
            ),
            const BasicYogaCardLayout(),
             Padding(
              padding: EdgeInsets.only(
                left: 2.w,
                top: 8.h,
                right: 2.w,
              ),
            ),
            const SessionLayout(),
          ],
        ),
      ),
    );
  }
}