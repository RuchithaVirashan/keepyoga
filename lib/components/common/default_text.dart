import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
  final String content;
  final double fontSizeR;
  final Color colorR;
  final TextAlign textAlignR;
  final FontWeight fontWeightR;
  final List<TextSpan>? children;

  const DefaultText({
    super.key,
    required this.content,
    required this.fontSizeR,
    required this.colorR,
    required this.textAlignR,
    required this.fontWeightR,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    if (children != null) {
      return RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: fontSizeR,
            fontWeight: fontWeightR,
            color: colorR,
          ),
          children: children!,
        ),
        textAlign: textAlignR,
      );
    } else {
      return Text(
        content,
        style: TextStyle(
          fontSize: fontSizeR,
          fontWeight: fontWeightR,
          color: colorR,
        ),
        textAlign: textAlignR,
      );
    }
  }
}
