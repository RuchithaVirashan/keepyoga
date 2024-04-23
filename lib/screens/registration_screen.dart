import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/common/back_app_bar.dart';
import '../components/common/default_text.dart';
import '../components/common/drop_down.dart';
import '../components/common/text_feild.dart';
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
  int selectedGender = 0;
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
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
    );
  }
}
