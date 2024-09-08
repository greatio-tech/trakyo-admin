import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class SalesDetailsWidget extends StatelessWidget {
  const SalesDetailsWidget({
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
                  text: 'Sales details',
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
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextWidget(
                text: 'Paid',
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                textColor: AppColors.textWhiteColor,
              ),
            ),
            const VSpace(24),
            const TitleAndSubTitle(
              title: 'Delivery Date',
              text: '22 Jul 2024',
            ),
            const VSpace(24),
            const TitleAndSubTitle(
              title: 'Delivery Address',
              text:
                  'ShameerNo.15 Ground Floor, Begur Road,Hongasandhara, Bommanahalli,Bengaluru, Karnataka 560068',
            ),
            const VSpace(32),
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
