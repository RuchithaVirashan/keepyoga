import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validate;
  final TextInputType? keybordType;
  final int? maxLine;
  final void Function(dynamic value)? onChanged;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validate,
    this.keybordType,
    this.maxLine,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: hintText,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        labelStyle: TextStyle(
          color: const Color(0xFF72777A),
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
        hintStyle: TextStyle(
          color: const Color(0xFF72777A),
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(
            color: Color(0xFFE3E5E5),
          ),
        ),
        contentPadding: EdgeInsets.only(
          left: 25.w,
          top: 15.h,
          bottom: 15.h,
        ),
        fillColor: const Color(0xFFFFFFFF),
        filled: true,
      ),
      validator: validate,
      keyboardType: keybordType,
      maxLines: maxLine,
      onChanged: onChanged,
    );
  }
}
