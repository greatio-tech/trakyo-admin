import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/screens/order/Widgets/order_details_widget.dart';
import 'package:trakyo_admin/screens/order/controller/order_controller.dart';
import 'package:trakyo_admin/widgets/filter_chip_widget.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/status_chip_widget.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class OrderScreen extends GetWidget<OrderController> {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: controller.getOrderLoading.isTrue
            ? const Center(child: LoadingIndicator())
            : ListView(
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
                                  text: 'Order',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                // const Spacer(),
                                // SizedBox(
                                //   width: 251.w,
                                //   child: const TextFiledWidget(
                                //     hintText: 'Search',
                                //     prefixIcon: Padding(
                                //       padding: EdgeInsets.all(10),
                                //       child: SvgIcon(
                                //         icon: 'assets/svg/search.svg',
                                //       ),
                                //     ),
                                //   ),
                                // ),
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
                            const VSpace(24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    children: [
                                      FilterChip1(
                                        controller: controller,
                                        position: 0,
                                        text: "All",
                                      ),
                                      FilterChip1(
                                        controller: controller,
                                        position: 1,
                                        text: "Pending",
                                      ),
                                      FilterChip1(
                                        controller: controller,
                                        position: 2,
                                        text: 'Shipped',
                                      ),
                                      FilterChip1(
                                        controller: controller,
                                        position: 3,
                                        text: 'Delivered',
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const VSpace(16),
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
                                          // Checkbox(
                                          //   activeColor: AppColors.primaryColor,
                                          //   value: true,
                                          //   onChanged: (value) {},
                                          // ),
                                          // const HSpace(5),
                                          TextWidget(
                                            text: 'Order ID',
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          const HSpace(60),
                                          TextWidget(
                                            text: 'User',
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          const HSpace(100),
                                          TextWidget(
                                            text: 'Quantity',
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          const HSpace(90),
                                          TextWidget(
                                            text: 'Delivery Due Date',
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          const HSpace(45),
                                          TextWidget(
                                            text: 'Delivery Address',
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          const HSpace(95),
                                          TextWidget(
                                            text: 'Payment mode',
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
                                            width: 40.w,
                                          )
                                        ],
                                      ),
                                    ),
                                    OrderList(
                                      orderList: controller
                                                  .currentIndex.value ==
                                              0
                                          ? controller.orderList
                                          : controller.currentIndex.value == 1
                                              ? controller.orderPendingList
                                              : controller.currentIndex.value ==
                                                      2
                                                  ? controller.orderShippedList
                                                  : controller
                                                      .orderDeliveredList,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // const VSpace(40),
                            // Row(
                            //   children: [
                            //     TextWidget(
                            //       text: "Show of 1 to 11 of 43 rows",
                            //       fontSize: 14.sp,
                            //       textColor: AppColors.textGreyColor,
                            //     ),
                            //     Container()
                            //   ],
                            // )
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

class OrderList extends StatelessWidget {
  const OrderList({
    super.key,
    required this.orderList,
  });

  final List orderList;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
        separatorBuilder: (context, index) {
          return Container(
            height: 2,
            color: const Color(0xFFF5F5F5),
          );
        },
        itemCount: orderList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          String formattedAddress =
              "${orderList[index].addressId.fullName}, ${orderList[index].addressId.phoneNumber}, ${orderList[index].addressId.buldingNumber}, ${orderList[index].addressId.city}, ${orderList[index].addressId.state}, ${orderList[index].addressId.pincode}";
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                SideSheet.right(
                  width: 400.w,
                  body: OrderDetailsWidget(
                    index: index,
                  ),
                  context: context,
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Checkbox(
                    //   activeColor:
                    //       AppColors.primaryColor,
                    //   value: true,
                    //   onChanged: (value) {},
                    // ),
                    // const HSpace(5),
                    TextWidget(
                      text: orderList[index]
                          .id
                          .substring(orderList[index].id.length - 5)
                          .toUpperCase(),
                      fontSize: 14.sp,
                    ),
                    const HSpace(70),
                    SizedBox(
                      width: 100.w,
                      child: TextWidget(
                        text: orderList[index].user.name,
                        fontSize: 14.sp,
                      ),
                    ),
                    const HSpace(50),
                    SizedBox(
                      width: 100.w,
                      child: TextWidget(
                        text: orderList[index].qrCodes.length.toString(),
                        fontSize: 14.sp,
                      ),
                    ),
                    const HSpace(25),
                    SizedBox(
                      width: 100.w,
                      child: TextWidget(
                        text: orderList[index].updatedAt.toString(),
                        fontSize: 14.sp,
                      ),
                    ),
                    const HSpace(60),
                    SizedBox(
                      width: 150.w,
                      child: TextWidget(
                        text: formattedAddress,
                        fontSize: 14.sp,
                        maxLines: 2,
                      ),
                    ),
                    const HSpace(60),
                    SizedBox(
                      width: 100.w,
                      child: TextWidget(
                        text: 'Net Banking',
                        fontSize: 14.sp,
                        maxLines: 2,
                      ),
                    ),
                    const Spacer(),
                    StatusChipWidget(
                      status: orderList[index].deliveryStatus,
                    ),
                    const HSpace(10),
                    // MouseRegion(
                    //   cursor:
                    //       SystemMouseCursors.click,
                    //   child: GestureDetector(
                    //     onTap: () {},
                    //     child: const SvgIcon(
                    //       icon:
                    //           'assets/svg/print.svg',
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
