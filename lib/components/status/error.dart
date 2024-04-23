import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/default_text.dart';

Future<void> showErrorDialog(BuildContext context, String content, String header) async {
  ScreenUtil.init(context);

  WidgetsBinding.instance.addPostFrameCallback((_) async {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: DefaultText(
          colorR: const Color(0xFF090A0A),
          content: header,
          fontSizeR: 16.sp,
          fontWeightR: FontWeight.w600,
          textAlignR: TextAlign.start,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DefaultText(
              colorR: const Color(0xFF090A0A),
              content: content,
              fontSizeR: 16.sp,
              fontWeightR: FontWeight.w300,
              textAlignR: TextAlign.start,
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Okay'),
          ),
        ],
      ),
    );
  });
}
