import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keepyoga/components/common/default_text.dart';

import '../components/common/back_app_bar.dart';
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
      appBar: HomeAppBar(),
      body: const Column(
        children: [
          // Padding(
          //   padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
          //   child: ButtonLayout(
          //     handleaddToCart: () {},
          //     handlebuyNow: () {},
          //   ),
          // ),
        ],
      ),
    );
  }
}
