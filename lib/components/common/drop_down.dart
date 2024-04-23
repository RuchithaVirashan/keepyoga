import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdown extends StatelessWidget {
  final List<String>? dropdownList;
  final Function handleMakeSelect;
  final String hintText;
  final String dropdownvalue;

  const CustomDropdown({
    super.key,
    required this.dropdownList,
    required this.handleMakeSelect,
    required this.hintText,
    required this.dropdownvalue,
  });

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    List<PopupMenuEntry<String>> popupMenuItems = [
      const PopupMenuItem<String>(
        value: 'No option',
        child: Text('No option'),
      ),
      if (dropdownList != null)
        ...dropdownList!.toSet().toList().map((String value) {
          return PopupMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }),
    ];

    return Theme(
      data: ThemeData(
        primaryColor: Colors.red,
      ),
      child: Container(
        width: ScreenUtil().screenWidth,
        height: 45.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: const Color(0xFFE3E5E5),
          ),
        ),
        child: PopupMenuButton<String>(
          initialValue: dropdownvalue == "No option" ? null : dropdownvalue,
          onSelected: (String? value) {
            handleMakeSelect(value);
          },
          offset: Offset(20.w, 80.h),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            alignment: Alignment.centerLeft,
            child: Text(
              dropdownvalue == "No option" ? hintText : dropdownvalue,
              style: TextStyle(
                color: const Color(0xFF72777A),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          itemBuilder: (BuildContext context) {
            return popupMenuItems;
          },
        ),
      ),
    );
  }
}
