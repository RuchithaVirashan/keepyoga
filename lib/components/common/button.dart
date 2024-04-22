import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonName;
  final Color buttonColor;
  final Color textColor;
  final double radius;
  final double minHeight;
  final void Function()? onPressed;

  const ButtonWidget({
    super.key,
    required this.buttonName,
    required this.textColor,
    required this.radius,
    required this.buttonColor,
    required this.minHeight,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        minimumSize: Size(double.infinity, minHeight),
        padding: EdgeInsets.all(8.r),
      ),
      onPressed: onPressed,
      child: Text(
        buttonName,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
