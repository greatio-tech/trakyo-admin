import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/widgets/button_widget.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/text_field_widget.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({
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
                  text: 'Order Details',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
            const VSpace(24),
            const TitleAndSubTitle(
              title: 'Order ID',
              text: '#123456',
            ),
            const VSpace(24),
            const TitleAndSubTitle(
              title: 'Quantity',
              text: '02 pcs',
            ),
            const VSpace(24),
            const TitleAndSubTitle(
              title: 'QR ID',
              text: '#123456, #123456',
            ),
            const VSpace(24),
            const TitleAndSubTitle(
              title: 'User',
              text: 'Shameer',
            ),
            const VSpace(24),
            const TitleAndSubTitle(
              title: 'Mobile Number',
              text: '90878 87356',
            ),
            const VSpace(24),
            const TitleAndSubTitle(
              title: 'Payment Mode',
              text: 'COD',
            ),
            const VSpace(24),
            TextWidget(
              text: 'Payment Status',
              fontSize: 12.sp,
            ),
            const VSpace(8),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 1.h,
                horizontal: 15.w,
              ),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextWidget(
                text: 'Pending',
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                textColor: AppColors.textWhiteColor,
              ),
            ),
            const VSpace(24),
            const TitleAndSubTitle(
              title: 'Delivery Address',
              text:
                  'ShameerNo.15 Ground Floor, Begur Road,Hongasandhara, Bommanahalli,Bengaluru, Karnataka 560068',
            ),
            const VSpace(32),
            TextWidget(
              text: "Status updation",
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
            ),
            const VSpace(24),
            const TextFiledWidget(
              headingText: 'Message user',
              maxLines: 5,
              hintText: "Enter message",
            ),
            const VSpace(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonWidget(
                  verticalPadding: 10.h,
                  width: 120.w,
                  text: 'Cancel Order',
                  color: AppColors.errorColor.withOpacity(.2),
                  textColor: AppColors.errorColor,
                  onTap: () {},
                ),
                const HSpace(16),
                ButtonWidget(
                  verticalPadding: 10.h,
                  width: 120.w,
                  text: 'Mark Shipped',
                  color: AppColors.primaryColor,
                  onTap: () {},
                  textColor: AppColors.textWhiteColor,
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
