import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keepyoga/screens/login_screen.dart';

import '../components/common/back_app_bar.dart';
import '../components/common/button.dart';
import '../components/common/default_text.dart';
import '../components/common/drop_down.dart';
import '../components/common/text_feild.dart';
import '../components/status/error.dart';
import '../services/validation/validate_service.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final ValidateService validateService = ValidateService();
  final formKey = GlobalKey<FormState>();

  String dropdownGendervalue = ('No option');
  int selectedGender = -1;
  List<String> genders = ['Male', 'Female', 'Other'];

  handleGenderSelect(String? value) {
    setState(() {
      dropdownGendervalue = value!;
      setState(() {
        selectedGender = genders.indexOf(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackAppBar(),
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Padding(
            padding: EdgeInsets.only(top: 10.h, left: 24.w, right: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                  colorR: const Color(0xFF090A0A),
                  content: 'Registration',
                  fontSizeR: 32.sp,
                  fontWeightR: FontWeight.w700,
                  textAlignR: TextAlign.start,
                ),
                DefaultText(
                  colorR: const Color(0xFF090A0A),
                  content: 'Create your account',
                  fontSizeR: 16.sp,
                  fontWeightR: FontWeight.w400,
                  textAlignR: TextAlign.start,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 7.5.h,
                  ),
                  child: CustomTextField(
                    controller: emailController,
                    hintText: 'Email',
                    validate: (value) => validateService.validateEmail(value!),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 7.5.h,
                  ),
                  child: CustomTextField(
                    controller: nameController,
                    hintText: 'user name',
                    validate: (value) => validateService.isEmptyField(value!),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: ScreenUtil().screenWidth * 0.4,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 7.5.h,
                        ),
                        child: CustomDropdown(
                          dropdownList: genders,
                          handleMakeSelect: handleGenderSelect,
                          hintText: 'gender',
                          dropdownvalue: dropdownGendervalue,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().screenWidth * 0.4,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 7.5.h,
                        ),
                        child: CustomTextField(
                          controller: ageController,
                          hintText: 'age',
                          validate: (value) =>
                              validateService.isEmptyField(value!),
                          keybordType: TextInputType.number,
                        ),
                      ),
                    ),
                  ],
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
                  padding: EdgeInsets.symmetric(
                    vertical: 7.5.h,
                  ),
                  child: CustomTextField(
                    controller: confirmPasswordController,
                    hintText: 'confirm password',
                    validate: (value) =>
                        validateService.validateConfirmPassword(
                            value!, passwordController.text),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: const Color(0xFFFFFFFF),
        child: Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          child: ButtonWidget(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                if (selectedGender != -1) {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 300),
                      transitionsBuilder: (context, animation, _, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                      pageBuilder: (_, __, ___) => const LoginScreen(),
                    ),
                  );
                } else {
                  showErrorDialog(context, 'Please select gender', 'Error');
                }
              } else {
                showErrorDialog(context, 'Please fill all fields', 'Error');
              }
            },
            minHeight: 48.h,
            buttonName: 'Create Acount',
            textColor: const Color(0xFFFFFFFF),
            buttonColor: const Color(0xFF6B4EFF),
            radius: 48.r,
          ),
        ),
      ),
    );
  }
}
