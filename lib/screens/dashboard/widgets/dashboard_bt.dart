import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class DashboardBt extends StatelessWidget {
  const DashboardBt({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap, required this.fontWeight, required this.textColor,
  });

  final String icon;
  final String text;
  final Function() onTap;
  final FontWeight fontWeight;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            SvgIcon(icon: icon),
            const HSpace(8),
            TextWidget(
              text: text,
              fontWeight: fontWeight,
              fontSize: 14.sp,
              textColor: textColor,
            )
          ],
        ),
      ),
    );
  }
}
