import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/screens/order/controller/order_controller.dart';
import 'package:trakyo_admin/screens/over_view/controller/overview_controller.dart';
import 'package:trakyo_admin/screens/over_view/widgets/cards.dart';
import 'package:trakyo_admin/screens/qr/controller/qr_controller.dart';
import 'package:trakyo_admin/screens/user/controller/users_controller.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/text_field_widget.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class OverViewScreen extends GetWidget<OverviewController> {
  const OverViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(OverviewController());
    return Obx(
      () => Expanded(
        child: SingleChildScrollView(
          child: Container(
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
                          text: 'Overview',
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
                    TextWidget(
                      text: 'Hello👋🏻',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    const VSpace(4),
                    TextWidget(
                      text: 'Check out latest update!',
                      fontSize: 14.sp,
                      textColor: AppColors.textGreyColor,
                    ),
                    const VSpace(24),
                    Row(
                      children: [
                        Cards(
                          icon: 'assets/svg/double profile.svg',
                          text: 'Total User',
                          richText1:
                              UsersController.to.usersList.length.toString(),
                          richText2: ' Users',
                        ),
                        const HSpace(32),
                        Cards(
                          icon: 'assets/svg/Qr blue.svg',
                          text: 'Total QR',
                          richText1: QrController.to.qrList.length.toString(),
                          richText2: ' QR',
                        ),
                        const HSpace(32),
                        Expanded(
                          child: Cards(
                            icon: 'assets/svg/bag blue.svg',
                            text: 'New QR sales',
                            richText1:
                                OrderController.to.orderList.length.toString(),
                            richText2: ' Orders',
                          ),
                        )
                      ],
                    ),
                    const VSpace(34),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: 'Sales Order',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        Container(
                          // padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: SizedBox(
                            height: 32.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.buttons.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Obx(
                                  () => MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.currentIndex.value = index;
                                      },
                                      child: Container(
                                        width: 84.w,
                                        decoration: BoxDecoration(
                                          color:
                                              controller.currentIndex.value ==
                                                      index
                                                  ? AppColors.primaryColor
                                                  : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Center(
                                          child: TextWidget(
                                            text: controller.buttons[index],
                                            textColor:
                                                controller.currentIndex.value ==
                                                        index
                                                    ? AppColors.textWhiteColor
                                                    : AppColors.textGreyColor,
                                            fontSize: 12.sp,
                                            fontWeight:
                                                controller.currentIndex.value ==
                                                        index
                                                    ? FontWeight.w500
                                                    : FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const VSpace(17),
                    Container(
                      // height: Get.height * .5.h,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SingleChildScrollView(
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
                                  TextWidget(
                                    text: 'ID',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  const HSpace(138),
                                  TextWidget(
                                    text: 'Name',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  const HSpace(145),
                                  TextWidget(
                                    text: 'Ordered date',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  const HSpace(95),
                                  TextWidget(
                                    text: 'Address',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  const HSpace(220),
                                  TextWidget(
                                    text: 'Delivery date',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  const Spacer(),
                                  TextWidget(
                                    text: 'Status',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  SizedBox(
                                    width: 30.w,
                                  )
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
                              itemCount: 5,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 24.h, horizontal: 20.w),
                                child: Row(
                                  children: [
                                    TextWidget(
                                      text: '#00001',
                                      fontSize: 14.sp,
                                    ),
                                    const HSpace(102),
                                    SizedBox(
                                      width: 100.w,
                                      child: TextWidget(
                                        text: 'Shameesdjfldsdr',
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    const HSpace(84),
                                    TextWidget(
                                      text: '13 Jul 2024',
                                      fontSize: 14.sp,
                                    ),
                                    const HSpace(100),
                                    SizedBox(
                                      width: 200.w,
                                      child: TextWidget(
                                        text:
                                            'Ground Floor, No.15, Begur..ksdajfjashdfj.',
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    const HSpace(80),
                                    TextWidget(
                                      text: '13 Jul 2024',
                                      fontSize: 14.sp,
                                    ),
                                    const Spacer(),
                                    // const HSpace(100),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 1.h,
                                        horizontal: 15.w,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: TextWidget(
                                        text: 'Delivered',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        textColor: AppColors.textWhiteColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const VSpace(32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: 'Tickets Requested',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        Container(
                          // padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: SizedBox(
                            height: 32.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.ticketBtList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Obx(
                                  () => MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.ticketCurrentIndex.value =
                                            index;
                                      },
                                      child: Container(
                                        width: 84.w,
                                        decoration: BoxDecoration(
                                          color: controller.ticketCurrentIndex
                                                      .value ==
                                                  index
                                              ? AppColors.primaryColor
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Center(
                                          child: TextWidget(
                                            text:
                                                controller.ticketBtList[index],
                                            textColor: controller
                                                        .ticketCurrentIndex
                                                        .value ==
                                                    index
                                                ? AppColors.textWhiteColor
                                                : AppColors.textGreyColor,
                                            fontSize: 12.sp,
                                            fontWeight: controller
                                                        .ticketCurrentIndex
                                                        .value ==
                                                    index
                                                ? FontWeight.w500
                                                : FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const VSpace(17),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(16),
                      // height: Get.height * .5.h,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const VSpace(5),
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 20,
                              ),
                              const HSpace(12),
                              SizedBox(
                                width: Get.width * .03.w,
                                child: TextWidget(
                                  text: 'Leo',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const HSpace(20),
                              Container(
                                height: 20,
                                width: 2,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(.2),
                                ),
                              ),
                              const HSpace(20),
                              const SvgIcon(
                                icon: 'assets/svg/Chat Dots.svg',
                              ),
                              const HSpace(5),
                              const Flexible(
                                child: TextWidget(
                                  text:
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing ipsum dolor sit amet Lorem  ipsum dolor,',
                                ),
                              ),
                              const Spacer(),
                              Container(
                                height: 20,
                                width: 2,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(.2),
                                ),
                              ),
                              const HSpace(20),
                              const TextWidget(text: '09:00 AM'),
                              const HSpace(20),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 1.h, horizontal: 15.w),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: TextWidget(
                                  text: 'Closed',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  textColor: AppColors.textWhiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
