import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/screens/dashboard/controller/dashboard_controller.dart';

import 'package:trakyo_admin/screens/dashboard/widgets/dashboard_bt.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return Scaffold(
      body: Obx(
        () => Row(
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
                  const DashboardButton(
                    index: 0,
                    iconActive: 'assets/svg/chart active.svg',
                    iconInactive: 'assets/svg/Chart.svg',
                    text: 'Over View',
                  ),
                  const VSpace(32),
                  const DashboardButton(
                    index: 1,
                    iconActive: 'assets/svg/Delivery active.svg',
                    iconInactive: 'assets/svg/Delivery.svg',
                    text: 'Order',
                  ),
                  const VSpace(32),
                  const DashboardButton(
                    index: 2,
                    iconActive: 'assets/svg/request active.svg',
                    iconInactive: 'assets/svg/User Tag.svg',
                    text: 'Request',
                  ),
                  const VSpace(32),
                  // const DashboardButton(
                  //   index: 3,
                  //   iconActive: 'assets/svg/sales active.svg',
                  //   iconInactive: 'assets/svg/Bag Check.svg',
                  //   text: 'Sales',
                  // ),
                  // const VSpace(32),
                  const DashboardButton(
                    index: 3,
                    iconActive: 'assets/svg/QR Code active.svg',
                    iconInactive: 'assets/svg/QR Code.svg',
                    text: 'QR',
                  ),
                  const VSpace(32),
                  const DashboardButton(
                    index: 4,
                    iconActive: 'assets/svg/User active.svg',
                    iconInactive: 'assets/svg/User.svg',
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
                          color: AppColors.primaryColor.withOpacity(.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset('assets/png/profile.png'),
                      ),
                      const HSpace(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: 'Tracker',
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
            controller.screens[controller.currentIndex.value],
          ],
        ),
      ),
    );
  }
}
