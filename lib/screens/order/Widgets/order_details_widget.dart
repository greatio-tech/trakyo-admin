import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/screens/order/controller/order_controller.dart';
import 'package:trakyo_admin/screens/order/model/order_model.dart';
import 'package:trakyo_admin/widgets/button_widget.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/status_chip_widget.dart';
import 'package:trakyo_admin/widgets/text_field_widget.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class OrderDetailsWidget extends GetWidget<OrderController> {
  const OrderDetailsWidget({
    super.key,
    required this.index,
    required this.orderList,
  });

  final int index;
  final List<OrdersModel> orderList;

  @override
  Widget build(BuildContext context) {
    String formattedAddress =
        "${orderList[index].addressId.fullName}, ${orderList[index].addressId.phoneNumber}, ${orderList[index].addressId.buldingNumber}, ${orderList[index].addressId.city}, ${orderList[index].addressId.state}, ${orderList[index].addressId.pincode}";
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
              text: orderList[index]
                  .id
                  .substring(orderList[index].id.length - 5)
                  .toUpperCase(),
            ),
            const VSpace(24),
            TitleAndSubTitle(
              title: 'Quantity',
              text: orderList[index].qrCodes.length.toString(),
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
                    separatorBuilder: (context, idx) => TextWidget(
                      text: ',  ',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: orderList[index].qrCodes.length,
                    itemBuilder: (context, idx) {
                      return TextWidget(
                        text: orderList[index]
                            .qrCodes[idx]
                            .substring(orderList[index].qrCodes[idx].length - 5)
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
            TitleAndSubTitle(title: 'User', text: orderList[index].user.name),
            const VSpace(24),
            TitleAndSubTitle(
              title: 'Mobile Number',
              text: orderList[index].user.phoneNumber,
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
              status: orderList[index].deliveryStatus,
            ),
            const VSpace(24),
            TitleAndSubTitle(
              title: 'Delivery Address',
              text: formattedAddress,
            ),
            const VSpace(32),
            Obx(
              () => Visibility(
                visible: orderList[index].deliveryStatus == 'pending',
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
                Visibility(
                  visible: orderList[index].deliveryStatus == 'pending' ||
                      orderList[index].deliveryStatus == 'shipped',
                  child: controller.getOrderLoading.isTrue
                      ? const LoadingIndicator()
                      : ButtonWidget(
                          verticalPadding: 10.h,
                          width: 125.w,
                          text: orderList[index].deliveryStatus == 'pending'
                              ? 'Mark Shipped'
                              : "Mark Delivered",
                          color: orderList[index].deliveryStatus == 'pending'
                              ? AppColors.primaryColor
                              : Colors.green,
                          onTap: () {
                            if (orderList[index].deliveryStatus == 'pending') {
                              controller.updateOrder(
                                orderList[index].id,
                                'shipped',
                                controller.trackingIdController.text,
                              );
                            }
                            if (orderList[index].deliveryStatus == 'shipped') {
                              controller.updateOrder(
                                orderList[index].id,
                                'delivered',
                                orderList[index].trackingId,
                              );
                            }
                          },
                          textColor: AppColors.textWhiteColor,
                        ),
                ),
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
