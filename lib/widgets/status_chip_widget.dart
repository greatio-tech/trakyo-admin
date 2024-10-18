import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/routes.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class StatusChipWidget extends StatelessWidget {
  const StatusChipWidget({
    super.key,
    required this.status,
  });
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 1.h,
        horizontal: 15.w,
      ),
      decoration: BoxDecoration(
        color: getStatusColor(status),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextWidget(
        text: status.toString().capitalizeFirst!,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        textColor: AppColors.textWhiteColor,
      ),
    );
  }
}

Color getStatusColor(String status) {
  switch (status.toLowerCase()) {
    case "paid":
    case "linked":
    case "delivered":
    case "closed":
    case "resolved":
    case "activated":
      return Colors.green;
    case "pending":
      return Colors.orange;
    case "cancelled":
    case "opened":
    case "not linked":
    case "deactivated":
      return Colors.red;
    case "shipped":
      return Colors.blue;
    default:
      return Colors.grey;
  }
}
