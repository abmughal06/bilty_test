import 'package:flutter/material.dart';

class AlignText extends StatelessWidget {
  final String? text;
  final EdgeInsets? padding;
  final Alignment? align;
  // final TextStyle? textStyle;
  final TextAlign? textAlign;
  final Color? textColor;
  final double? textSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;

  const AlignText({
    super.key,
    this.text,
    this.fontStyle,
    this.padding,
    this.align,
    // this.textStyle,
    this.textAlign,
    this.textColor,
    this.textSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Align(
        alignment: align ?? Alignment.centerLeft,
        child: Text(
          "$text",
          textAlign: textAlign ?? TextAlign.start,
          style: TextStyle(
            fontStyle: fontStyle ?? FontStyle.normal,
            color: textColor ?? Colors.black,
            fontSize: textSize ?? 14,
            fontWeight: fontWeight ?? FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
