// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BodyText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  const BodyText(
    this.text, {
    super.key,
    this.fontWeight,
    this.fontSize = 18,
    this.color = Colors.white,
    this.maxLines,
    this.overflow = TextOverflow.clip,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
