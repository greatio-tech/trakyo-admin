import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.icon,
    required this.text,
    required this.color,
    required this.textColor,
    required this.onTap,
    this.verticalPadding,
    this.horizontalPadding,
    this.height,
    this.width,
    this.border = false,
    this.isLoading,
  });

  final String? icon;
  final String text;
  final Color color;
  final Color textColor;
  final Function() onTap;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? height;
  final double? width;
  final bool? border;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: isLoading == true ? () {} : onTap,
        child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding ?? 10,
            horizontal: horizontalPadding ?? 16,
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: textColor,
              style: border == true ? BorderStyle.solid : BorderStyle.none,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null ? SvgIcon(icon: icon!) : const SizedBox(),
              icon != null ? const HSpace(5) : const SizedBox(),
              isLoading == true
                  ? const LoadingIndicator()
                  : TextWidget(
                      text: text,
                      fontSize: 14.sp,
                      textColor: textColor,
                      // fontWeight: FontWeight.w500,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
