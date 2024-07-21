
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class Cards extends StatelessWidget {
  const Cards({
    super.key,
    required this.icon,
    required this.text,
    required this.richText1,
    required this.richText2,
  });

  final String icon;
  final String text;
  final String richText1;
  final String richText2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 120.w, 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgIcon(
            icon: icon,
          ),
          const VSpace(17),
          TextWidget(
            text: text,
            fontSize: 14.sp,
            textColor: AppColors.textGreyColor,
          ),
          const VSpace(10),
          CustomRichText(
            textSpans: [
              TextSpan(
                text: richText1,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: AppConstants.fontFamily,
                ),
              ),
              TextSpan(
                text: richText2,
              ),
            ],
          )
        ],
      ),
    );
  }
}
