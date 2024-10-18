import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class FilterChip1 extends StatelessWidget {
  const FilterChip1({
    super.key,
    required this.controller,
    required this.position,
    required this.text,
  });

  final dynamic controller;
  final int position;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          controller.currentIndex.value = position;
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 3.h),
          width: 90.w,
          decoration: BoxDecoration(
            color: controller.currentIndex.value == position
                ? AppColors.primaryColor
                : Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: TextWidget(
              text: text,
              textColor: controller.currentIndex.value == position
                  ? AppColors.textWhiteColor
                  : AppColors.textGreyColor,
              fontSize: 12.sp,
              fontWeight: controller.currentIndex.value == position
                  ? FontWeight.w500
                  : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
