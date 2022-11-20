import 'package:flutter/material.dart';
import 'package:search_for_films/core/functions/size_conging.dart';

class KeyValueText extends StatelessWidget {
  final String keyText;
  final String valueText;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  const KeyValueText(
    this.keyText,
    this.valueText, {
    super.key,
    this.fontSize = 18,
    this.fontWeight,
    this.color = Colors.white,
    this.maxLines,
    this.overflow = TextOverflow.clip,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          keyText,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
          ),
          maxLines: maxLines,
        ),
        SizedBox(
          width: SizeConfig(context, 8)(),
        ),
        Flexible(
          child: Text(
            valueText,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color,
            ),
            maxLines: maxLines,
            overflow: overflow,
          ),
        ),
      ],
    );
  }
}
