import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/screens/qr/widgets/vehicle_details_widget.dart';
import 'package:trakyo_admin/widgets/button_widget.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/text_field_widget.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class QrDetailsWidget extends StatelessWidget {
  const QrDetailsWidget({
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
                  text: 'QR Details',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
            const VSpace(24),
            TextWidget(
              text: 'Qr ID',
              fontSize: 12.sp,
            ),
            const VSpace(8),
            const TextFiledWidget(),
            const VSpace(24),
            TextWidget(
              text: 'Owner',
              fontSize: 12.sp,
            ),
            const VSpace(8),
            const TextFiledWidget(),
            const VSpace(24),
            TextWidget(
              text: 'Owner Number',
              fontSize: 12.sp,
            ),
            const VSpace(8),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.lightGreyColor),
                  ),
                  child: const SvgIcon(
                    icon: "assets/svg/flag.svg",
                  ),
                ),
                const HSpace(8),
                Expanded(
                  child: TextFiledWidget(
                    hintText: 'Enter your mobile number',
                    keyboardType: TextInputType.number,
                    onChanged: (p0) {
                      if (p0.length == 10) {
                        FocusScope.of(Get.context!).unfocus();
                      }
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                    ],
                  ),
                ),
              ],
            ),
            const VSpace(24),
            Row(
              children: [
                TextWidget(
                  text: 'Emergency Details',
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                ),
                const Spacer(),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        const SvgIcon(
                          icon: 'assets/svg/Pen.svg',
                        ),
                        const HSpace(5),
                        TextWidget(
                          text: 'Edit info',
                          fontSize: 14.sp,
                          textColor: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const VSpace(24),
            TextWidget(
              text: 'Emergency contact No 01',
              fontSize: 12.sp,
            ),
            const VSpace(8),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.lightGreyColor),
                  ),
                  child: const SvgIcon(
                    icon: "assets/svg/flag.svg",
                  ),
                ),
                const HSpace(8),
                Expanded(
                  child: TextFiledWidget(
                    keyboardType: TextInputType.number,
                    onChanged: (p0) {
                      if (p0.length == 10) {
                        FocusScope.of(Get.context!).unfocus();
                      }
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                    ],
                  ),
                ),
              ],
            ),
            const VSpace(24),
            TextWidget(
              text: 'Emergency contact No 02',
              fontSize: 12.sp,
            ),
            const VSpace(8),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.lightGreyColor),
                  ),
                  child: const SvgIcon(
                    icon: "assets/svg/flag.svg",
                  ),
                ),
                const HSpace(8),
                Expanded(
                  child: TextFiledWidget(
                    keyboardType: TextInputType.number,
                    onChanged: (p0) {
                      if (p0.length == 10) {
                        FocusScope.of(Get.context!).unfocus();
                      }
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                    ],
                  ),
                ),
              ],
            ),
            const VSpace(24),
            Row(
              children: [
                TextWidget(
                  text: 'Vehicle details',
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                ),
                const Spacer(),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        const SvgIcon(
                          icon: 'assets/svg/Pen.svg',
                        ),
                        const HSpace(5),
                        TextWidget(
                          text: 'Edit info',
                          fontSize: 14.sp,
                          textColor: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const VSpace(24),
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(8),
              child: ListTile(
                onTap: () {

                  SideSheet.right(
                    width: 400.w,
                    body: const VehicleDetailsWidget(),
                    context: context,
                  );
                },
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                tileColor: Colors.white,
                dense: true,
                trailing:
                    const SvgIcon(icon: 'assets/svg/Round Alt Arrow Right.svg'),
                title: TextWidget(
                  text: 'Maruti suzuki Swift',
                  fontSize: 12.sp,
                  textColor: AppColors.textGreyColor,
                ),
                subtitle: TextWidget(
                  text: 'KL 01 U 3332',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const VSpace(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonWidget(
                  verticalPadding: 5.h,
                  width: 120.w,
                  text: 'Unlink',
                  color: AppColors.errorColor.withOpacity(.2),
                  textColor: AppColors.errorColor,
                  onTap: () {},
                ),
                const HSpace(16),
                ButtonWidget(
                  border: true,
                  verticalPadding: 5.h,
                  width: 120.w,
                  text: 'Deactivate',
                  color: Colors.white,
                  textColor: AppColors.errorColor,
                  onTap: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
