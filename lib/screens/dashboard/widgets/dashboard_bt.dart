import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/screens/dashboard/controller/dashboard_controller.dart';
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
class DashboardButton extends StatelessWidget {
  final int index;
  final String iconActive;
  final String iconInactive;
  final String text;

  const DashboardButton({
    Key? key,
    required this.index,
    required this.iconActive,
    required this.iconInactive,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Obx(
      () => DashboardBt(
        icon: controller.currentIndex.value == index ? iconActive : iconInactive,
        text: text,
        fontWeight: controller.currentIndex.value == index
            ? FontWeight.bold
            : FontWeight.normal,
        textColor: controller.currentIndex.value == index
            ? AppColors.primaryColor
            : AppColors.textBlackColor,
        onTap: () {
          controller.updateCurrentIndex(index);
        },
      ),
    );
  }
}
