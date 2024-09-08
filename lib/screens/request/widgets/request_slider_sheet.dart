import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/screens/request/widgets/user_details_slider_sheet.dart';
import 'package:trakyo_admin/widgets/button_widget.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/text_field_widget.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class RequestSliderSheet extends StatelessWidget {
  const RequestSliderSheet({
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
                  text: 'Request details',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
            const VSpace(25),
            TextWidget(
              text: "User",
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
            const VSpace(8),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => SideSheet.right(
                    width: 400.w,
                    context: context,
                    body: const UserDetailsSliderSheet()),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      SvgIcon(
                        icon: "assets/svg/profile_avatar.svg",
                        height: 56.w,
                        width: 56.w,
                      ),
                      const HSpace(12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: 'Shameer',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            textColor: AppColors.textBlackColor,
                          ),
                          TextWidget(
                            text: '+919999998778',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            textColor: AppColors.textGreyColor,
                          ),
                        ],
                      ),
                      const Spacer(),
                      const SvgIcon(
                          icon: "assets/svg/circle_forward_arrow.svg.svg"),
                      const HSpace(16)
                    ],
                  ),
                ),
              ),
            ),
            const VSpace(16),
            TextWidget(
              text: "Topic",
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
            const VSpace(8),
            TextFiledWidget(
              controller: TextEditingController(text: "QR scan"),
              readOnly: true,
            ),
            const VSpace(16),
            TextWidget(
              text: "Description",
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
            const VSpace(8),
            TextFiledWidget(
              controller: TextEditingController(
                  text:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna"),
              readOnly: true,
              disableHeight: true,
              maxLines: 10,
            ),
            const VSpace(16),
            TextWidget(
              text: "Attachment",
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
            const VSpace(8),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 13.w, vertical: 12.h),
                    child: Row(
                      children: [
                        const SvgIcon(icon: "assets/svg/attachment.svg"),
                        const HSpace(8),
                        TextWidget(
                          text: "IMG6789.png",
                          fontSize: 14.sp,
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const VSpace(16),
                itemCount: 2),
            const VSpace(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonWidget(
                  text: "Message user",
                  height: 40.h,
                  width: 152.w,
                  horizontalPadding: 0,
                  verticalPadding: 3,
                  color: AppColors.primaryColor.withOpacity(0.2),
                  textColor: AppColors.primaryColor,
                  onTap: () {},
                ),
                const HSpace(16),
                ButtonWidget(
                  text: "Resolved",
                  height: 40.h,
                  width: 152.w,
                  color: AppColors.primaryColor,
                  textColor: AppColors.textWhiteColor,
                  horizontalPadding: 0,
                  verticalPadding: 3,
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
