import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/screens/dashboard/controller/dashbord_controller.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/text_field_widget.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashbordController());
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 230.w,
            color: AppColors.backgroundColor,
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  // width: 116.w,
                  height: 32.h,
                  image: const AssetImage('assets/png/logo.png'),
                ),
                const VSpace(32),
                TextWidget(
                  text: 'Dashboard',
                  textColor: AppColors.textGreyColor,
                  fontSize: 14.sp,
                ),
                const VSpace(16),
                const DashboardBt(
                  icon: 'assets/svg/chart.svg',
                  text: 'Over View',
                ),
                const VSpace(32),
                const DashboardBt(
                  icon: 'assets/svg/QR Code.svg',
                  text: 'QR',
                ),
                const VSpace(32),
                const DashboardBt(
                  icon: 'assets/svg/User Tag.svg',
                  text: 'Request',
                ),
                const VSpace(32),
                const DashboardBt(
                  icon: 'assets/svg/Bag Check.svg',
                  text: 'Sales',
                ),
                const VSpace(32),
                const DashboardBt(
                  icon: 'assets/svg/User.svg',
                  text: 'User',
                ),
                const VSpace(32),
                TextWidget(
                  text: 'Profile',
                  textColor: AppColors.textGreyColor,
                  fontSize: 14.sp,
                ),
                const VSpace(16),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    const HSpace(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: 'Leo',
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                        TextWidget(
                          text: 'admin',
                          textColor: AppColors.textGreyColor,
                          fontSize: 12.sp,
                        ),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Center(
                  child: TextWidget(
                    text: 'Powered by trakyo',
                    textColor: AppColors.textGreyColor,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 2.w,
            height: double.infinity,
            color: Colors.white,
          ),
          Expanded(
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
                                prefixIcon: SvgIcon(
                                  icon: 'assets/svg/search.svg',
                                ),
                              ),
                            ),
                            const HSpace(16),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const SvgIcon(
                                icon: 'assets/svg/bell.svg',
                              ),
                            ),
                          ],
                        ),
                        const VSpace(40),
                        TextWidget(
                          text: 'Hello Shameer 👋🏻',
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
                        const Row(
                          children: [
                            Cards(
                              icon: 'assets/svg/double profile.svg',
                              text: 'Total User',
                              richText1: '40,000 ',
                              richText2: 'Users',
                            ),
                            HSpace(32),
                            Cards(
                              icon: 'assets/svg/Qr blue.svg',
                              text: 'Total QR',
                              richText1: '40,689 ',
                              richText2: 'Activated QR',
                            ),
                            HSpace(32),
                            Expanded(
                              child: Cards(
                                icon: 'assets/svg/bag blue.svg',
                                text: 'New QR sales',
                                richText1: '40,689 ',
                                richText2: 'Activated QR',
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
                                      () => GestureDetector(
                                        onTap: () {
                                          controller.currentIndex.value = index;
                                          print(index);
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
                                              textColor: controller
                                                          .currentIndex.value ==
                                                      index
                                                  ? AppColors.textWhiteColor
                                                  : AppColors.textGreyColor,
                                              fontSize: 12.sp,
                                              fontWeight: controller
                                                          .currentIndex.value ==
                                                      index
                                                  ? FontWeight.w500
                                                  : FontWeight.normal,
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
                                      const HSpace(98),
                                      TextWidget(
                                        text: 'Status',
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
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
                                        const HSpace(100),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 1.h, horizontal: 20.w),
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(20),
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
                                      () => GestureDetector(
                                        onTap: () {
                                          controller.ticketCurrentIndex.value =
                                              index;
                                          print(index);
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
                                              text: controller
                                                  .ticketBtList[index],
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
                                  SizedBox(
                                    width: Get.width * .43.w,
                                    child: const TextWidget(
                                      text:
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing ipsum dolor sit amet Lorem  ipsum dolor,',
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
                                  const TextWidget(text: '09:00 AM'),
                                  const HSpace(20),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 1.h, horizontal: 20.w),
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
                                  )
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
        ],
      ),
    );
  }
}

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

class DashboardBt extends StatelessWidget {
  const DashboardBt({
    super.key,
    required this.icon,
    required this.text,
  });

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          SvgIcon(icon: icon),
          const HSpace(8),
          TextWidget(
            text: text,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          )
        ],
      ),
    );
  }
}
