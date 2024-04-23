import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/common/button.dart';
import '../components/common/default_text.dart';
import '../components/common/text_feild.dart';
import '../components/status/error.dart';
import '../services/validation/validate_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final ValidateService validateService = ValidateService();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      "assets/Rectangle 51.png",
                      fit: BoxFit.cover,
                      width: ScreenUtil().screenWidth,
                      height: ScreenUtil().screenHeight - 350.h,
                    ),
                    Container(
                      width: double.infinity,
                      height: ScreenUtil().screenHeight - 350.h,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Color.fromRGBO(255, 255, 255, 0.69),
                            Color.fromRGBO(255, 255, 255, 0.606),
                            Color.fromRGBO(23, 10, 90, 0),
                          ],
                          stops: [0, 0.13, 1],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h, left: 24.w, right: 24.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 7.5.h,
                        ),
                        child: CustomTextField(
                          controller: emailController,
                          hintText: 'Email',
                          validate: (value) =>
                              validateService.validateEmail(value!),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 7.5.h,
                        ),
                        child: CustomTextField(
                          controller: passwordController,
                          hintText: 'password',
                          validate: (value) =>
                              validateService.validatePassword(value!),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 16.h,
                        ),
                        child: DefaultText(
                          colorR: const Color(0xFF6B4EFF),
                          content: 'Forgot password?',
                          fontSizeR: 16.sp,
                          fontWeightR: FontWeight.w500,
                          textAlignR: TextAlign.start,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 46.h,
                        ),
                        child: DefaultText(
                          colorR: const Color(0xFF090A0A),
                          content: '',
                          fontSizeR: 12.sp,
                          fontWeightR: FontWeight.w400,
                          textAlignR: TextAlign.start,
                          children: const [
                            TextSpan(
                              text: 'By continuing, you agree to our ',
                            ),
                            TextSpan(
                              text: 'Terms of Service ',
                              style: TextStyle(
                                color: Color(0xFF6B4EFF),
                              ),
                            ),
                            TextSpan(
                              text: 'and ',
                            ),
                            TextSpan(
                              text: 'Privacy Policy.',
                              style: TextStyle(
                                color: Color(0xFF6B4EFF),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                          right: 10.w,
                          top: 20.h,
                          bottom: 20.h,
                        ),
                        child: ButtonWidget(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
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
                                      const LoginScreen(),
                                ),
                              );
                            } else {
                              showErrorDialog(
                                  context, 'Please fill all fields', 'Error');
                            }
                          },
                          minHeight: 48.h,
                          buttonName: 'Log in',
                          textColor: const Color(0xFFFFFFFF),
                          buttonColor: const Color(0xFF6B4EFF),
                          radius: 48.r,
                        ),
                      )
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
}
