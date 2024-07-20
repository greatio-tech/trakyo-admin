import 'package:flutter/material.dart';
import 'package:trakyo_admin/core/constant.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    this.textColor = AppColors.textBlackColor,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines,
    this.textAlign,
    this.textHeight,
  });

  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;
  final double? textHeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
      style: TextStyle(
        color: textColor ?? AppColors.textBlackColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: AppConstants.fontFamily,
        height: textHeight,
      ),
    );
  }
}
