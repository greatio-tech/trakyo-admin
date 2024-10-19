import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/screens/order/controller/order_controller.dart';
import 'package:trakyo_admin/widgets/button_widget.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/status_chip_widget.dart';
import 'package:trakyo_admin/widgets/text_field_widget.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class OrderDetailsWidget extends GetWidget<OrderController> {
  const OrderDetailsWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    String formattedAddress =
        "${OrderController.to.orderList[index].addressId.fullName}, ${OrderController.to.orderList[index].addressId.phoneNumber}, ${OrderController.to.orderList[index].addressId.buldingNumber}, ${OrderController.to.orderList[index].addressId.city}, ${OrderController.to.orderList[index].addressId.state}, ${OrderController.to.orderList[index].addressId.pincode}";
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
                  text: 'Order Details',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
            const VSpace(24),
            TitleAndSubTitle(
              title: 'Order ID',
              text: OrderController.to.orderList[index].id
                  .substring(OrderController.to.orderList[index].id.length - 5)
                  .toUpperCase(),
            ),
            const VSpace(24),
            TitleAndSubTitle(
              title: 'Quantity',
              text:
                  OrderController.to.orderList[index].qrCodes.length.toString(),
            ),
            const VSpace(24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: "QR ID",
                  fontSize: 12.sp,
                ),
                const VSpace(8),
                SizedBox(
                  height: 20,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => TextWidget(
                      text: ',  ',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount:
                        OrderController.to.orderList[index].qrCodes.length,
                    itemBuilder: (context, idx) {
                      return TextWidget(
                        text: OrderController.to.orderList[index].qrCodes[idx]
                            .substring(OrderController
                                    .to.orderList[index].qrCodes[idx].length -
                                5)
                            .toUpperCase(),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        maxLines: 5,
                      );
                    },
                  ),
                ),
              ],
            ),
            // const TitleAndSubTitle(
            //   title: 'QR ID',
            //   text: '#123456, #123456',
            // ),
            const VSpace(24),
            TitleAndSubTitle(
                title: 'User',
                text: OrderController.to.orderList[index].user.name),
            const VSpace(24),
            TitleAndSubTitle(
              title: 'Mobile Number',
              text: OrderController.to.orderList[index].user.phoneNumber,
            ),
            const VSpace(24),
            const TitleAndSubTitle(
              title: 'Payment Mode',
              text: 'Net Banking',
            ),
            const VSpace(24),
            TextWidget(
              text: 'Status',
              fontSize: 12.sp,
            ),
            const VSpace(8),
            StatusChipWidget(
              status: OrderController.to.orderList[index].deliveryStatus,
            ),
            const VSpace(24),
            TitleAndSubTitle(
              title: 'Delivery Address',
              text: formattedAddress,
            ),
            const VSpace(32),
            Obx(
              () => Visibility(
                visible:
                    controller.orderList[index].deliveryStatus == 'pending',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "Status updation",
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                    ),
                    const VSpace(15),
                    TextFiledWidget(
                      controller: controller.trackingIdController,
                      headingText: 'Order Tracking ID',
                      maxLines: 5,
                      hintText: "Enter order tracking ID",
                    ),
                    const VSpace(20),
                  ],
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // ButtonWidget(
                //   verticalPadding: 10.h,
                //   width: 120.w,
                //   text: 'Cancel Order',
                //   color: AppColors.errorColor.withOpacity(.2),
                //   textColor: AppColors.errorColor,
                //   onTap: () {},
                // ),
                // const HSpace(16),
                Obx(
                  () => Visibility(
                    visible: controller.orderList[index].deliveryStatus ==
                            'pending' ||
                        controller.orderList[index].deliveryStatus == 'shipped',
                    child: ButtonWidget(
                      verticalPadding: 10.h,
                      width: 125.w,
                      text: controller.orderList[index].deliveryStatus ==
                              'pending'
                          ? 'Mark Shipped'
                          : "Mark Delivered",
                      color: controller.orderList[index].deliveryStatus ==
                              'pending'
                          ? AppColors.primaryColor
                          : Colors.green,
                      onTap: () {
                        if (controller.orderList[index].deliveryStatus ==
                            'pending') {
                          controller.updateOrder(
                            controller.orderList[index].id,
                            'shipped',
                            controller.trackingIdController.text,
                          );
                        }
                        if (controller.orderList[index].deliveryStatus ==
                            'shipped') {
                          controller.updateOrder(
                            controller.orderList[index].id,
                            'delivered',
                            controller.orderList[index].trackingId,
                          );
                        }
                      },
                      textColor: AppColors.textWhiteColor,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TitleAndSubTitle extends StatelessWidget {
  const TitleAndSubTitle({
    super.key,
    required this.title,
    required this.text,
  });
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: title,
          fontSize: 12.sp,
        ),
        const VSpace(8),
        TextWidget(
          text: text,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          maxLines: 5,
        ),
      ],
    );
  }
}
