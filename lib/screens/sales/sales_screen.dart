import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/widgets/button_widget.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/text_field_widget.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class SalesScreen extends StatelessWidget {
  const SalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                          text: 'Sales',
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
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          width: 215.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: 'Total Revenu',
                                fontSize: 14.sp,
                                textColor: AppColors.textGreyColor,
                              ),
                              const VSpace(10),
                              TextWidget(
                                text: '₹40,689',
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                            ],
                          ),
                        ),
                        const HSpace(32),
                        Container(
                          padding: const EdgeInsets.all(20),
                          width: 215.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: 'Total QR sold',
                                fontSize: 14.sp,
                                textColor: AppColors.textGreyColor,
                              ),
                              const VSpace(10),
                              CustomRichText(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                textSpans: [
                                  const TextSpan(
                                    text: '200',
                                  ),
                                  TextSpan(
                                    text: ' Pcs',
                                    style: TextStyle(
                                      fontFamily: AppConstants.fontFamily,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ButtonWidget(
                          icon: 'assets/svg/Export.svg',
                          text: 'Export data',
                          color: AppColors.primaryColor.withOpacity(0.2),
                          textColor: AppColors.primaryColor,
                          onTap: () {},
                        ),
                        const HSpace(16),
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
                                  Checkbox(
                                    activeColor: AppColors.primaryColor,
                                    value: true,
                                    onChanged: (value) {},
                                  ),
                                  const HSpace(5),
                                  TextWidget(
                                    text: 'Order ID',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  const HSpace(80),
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
                                  const HSpace(55),
                                  TextWidget(
                                    text: 'Delivered Date',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  const HSpace(90),
                                  TextWidget(
                                    text: 'Delivered Address',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  const HSpace(110),
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
                                    width: 60.w,
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
                              itemCount: 8,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  SideSheet.right(
                                    width: 400.w,
                                    body: SingleChildScrollView(
                                      child: Container(
                                        padding: const EdgeInsets.all(32),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                MouseRegion(
                                                  cursor:
                                                      SystemMouseCursors.click,
                                                  child: GestureDetector(
                                                    onTap: () => Get.back(),
                                                    child: const SvgIcon(
                                                      icon:
                                                          'assets/svg/Arrow Left.svg',
                                                    ),
                                                  ),
                                                ),
                                                const HSpace(10),
                                                TextWidget(
                                                  text: 'QR Details',
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500,
                                                )
                                              ],
                                            ),
                                            const VSpace(24),
                                            TextWidget(
                                              text: 'Qr ID',
                                              fontSize: 12.sp,
                                            ),
                                            const VSpace(8),
                                            const TextFiledWidget(),
                                            const VSpace(24),
                                            TextWidget(
                                              text: 'Owner',
                                              fontSize: 12.sp,
                                            ),
                                            const VSpace(8),
                                            const TextFiledWidget(),
                                            const VSpace(24),
                                            TextWidget(
                                              text: 'Owner Number',
                                              fontSize: 12.sp,
                                            ),
                                            const VSpace(8),
                                            Row(
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: AppColors
                                                            .lightGreyColor),
                                                  ),
                                                  child: const SvgIcon(
                                                    icon: "assets/svg/flag.svg",
                                                  ),
                                                ),
                                                const HSpace(8),
                                                Expanded(
                                                  child: TextFiledWidget(
                                                    hintText:
                                                        'Enter your mobile number',
                                                    keyboardType:
                                                        TextInputType.number,
                                                    onChanged: (p0) {
                                                      if (p0.length == 10) {
                                                        FocusScope.of(
                                                                Get.context!)
                                                            .unfocus();
                                                      }
                                                    },
                                                    inputFormatters: [
                                                      LengthLimitingTextInputFormatter(
                                                          10),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const VSpace(24),
                                            Row(
                                              children: [
                                                TextWidget(
                                                  text: 'Emergency Details',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18.sp,
                                                ),
                                                const Spacer(),
                                                MouseRegion(
                                                  cursor:
                                                      SystemMouseCursors.click,
                                                  child: GestureDetector(
                                                    onTap: () {},
                                                    child: Row(
                                                      children: [
                                                        const SvgIcon(
                                                          icon:
                                                              'assets/svg/Pen.svg',
                                                        ),
                                                        const HSpace(5),
                                                        TextWidget(
                                                          text: 'Edit info',
                                                          fontSize: 14.sp,
                                                          textColor: AppColors
                                                              .primaryColor,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const VSpace(24),
                                            TextWidget(
                                              text: 'Emergency contact No 01',
                                              fontSize: 12.sp,
                                            ),
                                            const VSpace(8),
                                            Row(
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: AppColors
                                                            .lightGreyColor),
                                                  ),
                                                  child: const SvgIcon(
                                                    icon: "assets/svg/flag.svg",
                                                  ),
                                                ),
                                                const HSpace(8),
                                                Expanded(
                                                  child: TextFiledWidget(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    onChanged: (p0) {
                                                      if (p0.length == 10) {
                                                        FocusScope.of(
                                                                Get.context!)
                                                            .unfocus();
                                                      }
                                                    },
                                                    inputFormatters: [
                                                      LengthLimitingTextInputFormatter(
                                                          10),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const VSpace(24),
                                            TextWidget(
                                              text: 'Emergency contact No 02',
                                              fontSize: 12.sp,
                                            ),
                                            const VSpace(8),
                                            Row(
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: AppColors
                                                            .lightGreyColor),
                                                  ),
                                                  child: const SvgIcon(
                                                    icon: "assets/svg/flag.svg",
                                                  ),
                                                ),
                                                const HSpace(8),
                                                Expanded(
                                                  child: TextFiledWidget(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    onChanged: (p0) {
                                                      if (p0.length == 10) {
                                                        FocusScope.of(
                                                                Get.context!)
                                                            .unfocus();
                                                      }
                                                    },
                                                    inputFormatters: [
                                                      LengthLimitingTextInputFormatter(
                                                          10),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const VSpace(24),
                                            Row(
                                              children: [
                                                TextWidget(
                                                  text: 'Vehicle details',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18.sp,
                                                ),
                                                const Spacer(),
                                                MouseRegion(
                                                  cursor:
                                                      SystemMouseCursors.click,
                                                  child: GestureDetector(
                                                    onTap: () {},
                                                    child: Row(
                                                      children: [
                                                        const SvgIcon(
                                                          icon:
                                                              'assets/svg/Pen.svg',
                                                        ),
                                                        const HSpace(5),
                                                        TextWidget(
                                                          text: 'Edit info',
                                                          fontSize: 14.sp,
                                                          textColor: AppColors
                                                              .primaryColor,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const VSpace(24),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      TextWidget(
                                                        text:
                                                            'Registration Number',
                                                        fontSize: 12.sp,
                                                      ),
                                                      const VSpace(8),
                                                      const TextFiledWidget(),
                                                    ],
                                                  ),
                                                ),
                                                const HSpace(16),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      TextWidget(
                                                        text: 'Vehicle Type',
                                                        fontSize: 12.sp,
                                                      ),
                                                      const VSpace(8),
                                                      const TextFiledWidget(),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const VSpace(24),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      TextWidget(
                                                        text: 'Vehicle Make',
                                                        fontSize: 12.sp,
                                                      ),
                                                      const VSpace(8),
                                                      const TextFiledWidget(),
                                                    ],
                                                  ),
                                                ),
                                                const HSpace(16),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      TextWidget(
                                                        text: 'Vehicle Model',
                                                        fontSize: 12.sp,
                                                      ),
                                                      const VSpace(8),
                                                      const TextFiledWidget(),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const VSpace(40),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                ButtonWidget(
                                                  verticalPadding: 5.h,
                                                  width: 120.w,
                                                  text: 'Unlink',
                                                  color: AppColors.errorColor
                                                      .withOpacity(.2),
                                                  textColor:
                                                      AppColors.errorColor,
                                                  onTap: () {},
                                                ),
                                                const HSpace(16),
                                                ButtonWidget(
                                                  border: true,
                                                  verticalPadding: 5.h,
                                                  width: 120.w,
                                                  text: 'Deactivate',
                                                  color: Colors.white,
                                                  textColor:
                                                      AppColors.errorColor,
                                                  onTap: () {},
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    context: context,
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 24.h, horizontal: 20.w),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        activeColor: AppColors.primaryColor,
                                        value: true,
                                        onChanged: (value) {},
                                      ),
                                      const HSpace(5),
                                      TextWidget(
                                        text: '#00001',
                                        fontSize: 14.sp,
                                      ),
                                      const HSpace(80),
                                      SizedBox(
                                        width: 100.w,
                                        child: TextWidget(
                                          text: 'Jon Doe jone Doe',
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      const HSpace(40),
                                      TextWidget(
                                        text: '01 pcs',
                                        fontSize: 14.sp,
                                      ),
                                      const HSpace(70),
                                      TextWidget(
                                        text: '22 Jul 2024',
                                        fontSize: 14.sp,
                                      ),
                                      const HSpace(80),
                                      SizedBox(
                                        width: 200.w,
                                        child: TextWidget(
                                          text:
                                              'Lorem ipsum dolor sit ame lajsdfjsfddjasdilkjs',
                                          fontSize: 14.sp,
                                          maxLines: 1,
                                        ),
                                      ),
                                      const HSpace(60),

                                      TextWidget(
                                        text: 'Net banking',
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
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: TextWidget(
                                          text: 'Delivered',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          textColor: AppColors.textWhiteColor,
                                        ),
                                      ),
                                      const HSpace(10),
                                      MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: const SvgIcon(
                                            icon: 'assets/svg/print.svg',
                                          ),
                                        ),
                                      )
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
                    Row(
                      children: [
                        TextWidget(
                          text: "Show of 1 to 11 of 43 rows",
                          fontSize: 14.sp,
                          textColor: AppColors.textGreyColor,
                        ),
                        Container()
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
