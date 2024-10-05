import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/screens/request/controller/request_controller.dart';
import 'package:trakyo_admin/screens/user/controller/users_controller.dart';
import 'package:trakyo_admin/utils/common_functions.dart';
import 'package:trakyo_admin/widgets/button_widget.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/text_field_widget.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class RequestSliderSheet extends GetWidget<RequestController> {
  final int currentIndex;
  const RequestSliderSheet({
    super.key,
    required this.currentIndex,
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
                onTap: () {
                  UsersController.to.goToUserSlideSheet(
                      controller.requestList[currentIndex].user!.id, context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
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
                            text: controller.requestList[currentIndex].user !=
                                    null
                                ? controller
                                    .requestList[currentIndex].user!.name
                                : "null",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            textColor: AppColors.textBlackColor,
                          ),
                          TextWidget(
                            text: controller.requestList[currentIndex].user !=
                                    null
                                ? controller
                                    .requestList[currentIndex].user!.phoneNumber
                                : "null",
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
              controller: TextEditingController(
                  text: controller.requestList[currentIndex].topic.name),
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
                  text: controller.requestList[currentIndex].description),
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
                  return MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        CommonFunctions.launchUrl(controller
                            .requestList[currentIndex].attachments[index]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 13.w, vertical: 12.h),
                        child: Row(
                          children: [
                            const SvgIcon(icon: "assets/svg/attachment.svg"),
                            const HSpace(8),
                            Flexible(
                              child: TextWidget(
                                text: controller.requestList[currentIndex]
                                    .attachments[index]
                                    .split("/")
                                    .last,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const VSpace(16),
                itemCount:
                    controller.requestList[currentIndex].attachments.length),
            const VSpace(40),
            Obx(
              () => Row(
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
                    onTap: () {
                      String subject = "Trakyo message";
                      String body =
                          "This message is sent from Trakyo admin panel";

                      CommonFunctions.launchUrl(
                          'https://mail.google.com/mail/?view=cm&fs=1&to=${controller.requestList[currentIndex].user!.email}&su=$subject&body=$body');
                    },
                  ),
                  const HSpace(16),
                  if (controller.requestList[currentIndex].status.value ==
                      "open")
                    ButtonWidget(
                      text: "Resolved",
                      height: 40.h,
                      width: 152.w,
                      color: AppColors.primaryColor,
                      textColor: AppColors.textWhiteColor,
                      horizontalPadding: 0,
                      verticalPadding: 3,
                      isLoading: controller.closeRequestLoading.value,
                      onTap: () {
                        controller.closeRequest(
                            controller.requestList[currentIndex].id);
                      },
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
