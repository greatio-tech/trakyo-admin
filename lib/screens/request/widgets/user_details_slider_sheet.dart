import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/widgets/pref_tile.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/text_field_widget.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class UserDetailsSliderSheet extends StatelessWidget {
  const UserDetailsSliderSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: const SvgIcon(
                      icon: 'assets/svg/Arrow Left.svg',
                    ),
                  ),
                ),
                const HSpace(10),
                TextWidget(
                  text: 'User details',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
            const VSpace(25),
            TextWidget(
              text: "Profile",
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
            const VSpace(8),
            SvgIcon(
              icon: "assets/svg/profile_avatar.svg",
              height: 98.h,
              width: 98.h,
            ),
            const VSpace(16),
            TextWidget(
              text: "Full Name",
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
            const VSpace(8),
            TextFiledWidget(
              controller: TextEditingController(text: "Shameer"),
              readOnly: true,
              height: 56.h,
            ),
            const VSpace(16),
            TextWidget(
              text: "Mobile Number",
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
            const VSpace(8),
            TextFiledWidget(
              controller: TextEditingController(text: "+91 7865954657"),
              readOnly: true,
              height: 56.h,
            ),
            const VSpace(16),
            TextWidget(
              text: "Mail",
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
            const VSpace(8),
            TextFiledWidget(
              controller: TextEditingController(text: "abc@gmail.com"),
              readOnly: true,
              height: 56.h,
            ),
            const VSpace(16),
            TextWidget(
              text: "DOB",
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
            const VSpace(8),
            TextFiledWidget(
              controller: TextEditingController(text: "02/02/2002"),
              readOnly: true,
              height: 56.h,
            ),
            const VSpace(32),
            TextWidget(
              text: "User QR",
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
            ),
            const VSpace(24),
            PrefTile.more(
                title: "Shameer Swift",
                subtitle: "1277BGH8817",
                leading: const SvgIcon(icon: "assets/svg/qr_code_round.svg"),
                titleStyle: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textGreyColor,
                ),
                minHeight: true,
                subTitleStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlackColor,
                ),
                onTap: () {}),
            const VSpace(32),
            TextWidget(
              text: "User Vehicle",
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
            ),
            const VSpace(24),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return PrefTile.more(
                      title: "Maruti suzuki Swift",
                      subtitle: "KL 01 U 3332",
                      titleStyle: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGreyColor,
                      ),
                      subTitleStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textBlackColor,
                      ),
                      minHeight: true,
                      onTap: () {});
                },
                separatorBuilder: (context, index) => const VSpace(16),
                itemCount: 2)
          ],
        ),
      ),
    );
  }
}
