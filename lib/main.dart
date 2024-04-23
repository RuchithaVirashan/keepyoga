import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keepyoga/screens/main_screen.dart';
import 'dart:ui' as ui;
import 'screens/launch_screen.dart';
import 'utils/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const ui.Size(375, 812),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'keepyoga',
            theme: AppTheme.lightTheme,
            // routes: {
            //   '/items': (context) => const MainScreen(selectedIndex: 1),
            //   '/invoice': (context) => const MainScreen(selectedIndex: 0),
            //   '/main': (context) => const MainScreen(selectedIndex: 0),
            //   '/login': (context) => const LoginScreen(),
            //   '/splash': (context) => const SplashScreen(),
            //   '/addItem': (context) => const AddItemScreen(),
            //   '/createInvoice': (context) => const CreateInvoiceScreen(),
            // },
            home: const MainScreen(
              selectedIndex: 0,
            ),
          );
        });
  }
}
