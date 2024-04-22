import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/common/back_app_bar.dart';
import '../components/common/default_text.dart';
import '../components/common/text_feild.dart';
import '../services/validation/validate_service.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController emailController = TextEditingController();
  final ValidateService validateService = ValidateService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
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
                  hintText: 'Name',
                  validate: (value) => validateService.isEmptyFieldWithLength(
                      value!, 'Item Name'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
