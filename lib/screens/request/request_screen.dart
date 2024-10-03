import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/screens/request/controller/request_controller.dart';
import 'package:trakyo_admin/screens/request/widgets/request_slider_sheet.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/text_field_widget.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class RequestScreen extends GetWidget<RequestController> {
  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: ListView(
          children: [
            Container(
              color: AppColors.backgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: SizedBox(
                  width: double.infinity.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TextWidget(
                            text: 'Dashboard / ',
                            fontSize: 14.sp,
                            textColor: AppColors.textGreyColor,
                          ),
                          TextWidget(
                            text: 'Request',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 251.w,
                            child: const TextFiledWidget(
                              hintText: 'Search',
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(10),
                                child: SvgIcon(
                                  icon: 'assets/svg/search.svg',
                                ),
                              ),
                            ),
                          ),
                          // const HSpace(16),
                          // Container(
                          //   padding: const EdgeInsets.all(8),
                          //   decoration: BoxDecoration(
                          //     color: Colors.white,
                          //     borderRadius: BorderRadius.circular(6),
                          //   ),
                          //   child: const SvgIcon(
                          //     icon: 'assets/svg/bell.svg',
                          //   ),
                          // ),
                        ],
                      ),
                      const VSpace(40),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF5F5F5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 24.h, horizontal: 20.w),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: TextWidget(
                                        text: 'User',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: TextWidget(
                                        text: 'Topic',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: TextWidget(
                                        text: 'Description',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: TextWidget(
                                        text: 'Date raised',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: TextWidget(
                                        text: 'Status',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ListView.separated(
                                separatorBuilder: (context, index) {
                                  return Container(
                                    height: 2,
                                    color: const Color(0xFFF5F5F5),
                                  );
                                },
                                itemCount: controller.requestList.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    SideSheet.right(
                                        width: 400.w,
                                        context: context,
                                        body: RequestSliderSheet(
                                          currentIndex: index,
                                        ));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 24.h, horizontal: 20.w),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: TextWidget(
                                            text: controller.requestList[index]
                                                        .user !=
                                                    null
                                                ? controller.requestList[index]
                                                    .user!.name
                                                : "null",
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: TextWidget(
                                            text: controller
                                                .requestList[index].topic.name,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: TextWidget(
                                            text: controller
                                                .requestList[index].description,
                                            maxLines: 2,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: TextWidget(
                                            text: DateFormat('dd-MM-yyyy')
                                                .format(controller
                                                    .requestList[index]
                                                    .createdAt),
                                            fontSize: 14.sp,
                                            maxLines: 2,
                                          ),
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: Obx(
                                            () => Container(
                                              width: 80.w,
                                              padding: EdgeInsets.symmetric(
                                                vertical: 1.h,
                                                horizontal: 15.w,
                                              ),
                                              decoration: BoxDecoration(
                                                color: controller
                                                            .requestList[index]
                                                            .status
                                                            .value !=
                                                        "closed"
                                                    ? Colors.green
                                                    : Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Center(
                                                child: TextWidget(
                                                  text: (controller
                                                          .requestList[index]
                                                          .status)
                                                      .value
                                                      .capitalizeFirst!,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                  textColor:
                                                      AppColors.textWhiteColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const VSpace(40),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
