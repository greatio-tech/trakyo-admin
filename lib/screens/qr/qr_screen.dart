import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/text_field_widget.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class QrScreen extends StatelessWidget {
  const QrScreen({super.key});

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
                          text: 'QR',
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
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Container(
                        //   width: 200.w,
                        //   height: 40.h,
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius: BorderRadius.circular(10),
                        //   ),
                        // ),
                        const Spacer(),
                        ButtonWidget(
                          icon: 'assets/svg/Export.svg',
                          text: 'Export data',
                          color: AppColors.primaryColor.withOpacity(0.2),
                          textColor: AppColors.primaryColor,
                          onTap: () {},
                        ),
                        const HSpace(16),
                        ButtonWidget(
                          icon: 'assets/svg/add-rectangle.svg',
                          text: 'Add new QR',
                          color: AppColors.primaryColor,
                          textColor: AppColors.textWhiteColor,
                          onTap: () {
                            SideSheet.right(
                              width: 400.w,
                              body: Container(
                                padding: const EdgeInsets.all(32),
                                child: Column(
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
                                          text: 'Add new QR',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        )
                                      ],
                                    ),
                                    const VSpace(24),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextWidget(
                                                text: 'User',
                                                fontSize: 12.sp,
                                              ),
                                              const VSpace(8),
                                              const TextFiledWidget(),
                                            ],
                                          ),
                                        ),
                                        const HSpace(10),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextWidget(
                                                text: 'Select quantity',
                                                fontSize: 12.sp,
                                              ),
                                              const VSpace(8),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 3.h,
                                                    horizontal: 5.w),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          Colors.grey.shade300),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    const SvgIcon(
                                                      icon:
                                                          'assets/svg/Minus Square.svg',
                                                    ),
                                                    TextWidget(
                                                      text: '01',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.sp,
                                                    ),
                                                    const SvgIcon(
                                                      icon:
                                                          'assets/svg/plus square.svg',
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    const VSpace(40),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ButtonWidget(
                                          verticalPadding: 5.h,
                                          width: 120.w,
                                          text: 'Cancel',
                                          color: AppColors.errorColor
                                              .withOpacity(.2),
                                          textColor: AppColors.errorColor,
                                          onTap: () {},
                                        ),
                                        const HSpace(16),
                                        ButtonWidget(
                                          verticalPadding: 5.h,
                                          width: 120.w,
                                          text: 'Add',
                                          color: AppColors.primaryColor,
                                          textColor: AppColors.textWhiteColor,
                                          onTap: () {},
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              context: context,
                            );
                          },
                        ),
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
                                    text: 'QR ID',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  const HSpace(138),
                                  TextWidget(
                                    text: 'User',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  const HSpace(145),
                                  TextWidget(
                                    text: 'Vehicle',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  const HSpace(95),
                                  TextWidget(
                                    text: 'Owner Number',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  const HSpace(90),
                                  TextWidget(
                                    text: 'Emergency Number',
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
                              itemCount: 5,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Padding(
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
                                      text: 'KL 01 A 3232',
                                      fontSize: 14.sp,
                                    ),
                                    const HSpace(70),
                                    TextWidget(
                                      text: '+91-89089 08901',
                                      fontSize: 14.sp,
                                    ),
                                    const HSpace(80),
                                    TextWidget(
                                      text: '+91-89089 08901',
                                      fontSize: 14.sp,
                                      maxLines: 2,
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

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.icon,
    required this.text,
    required this.color,
    required this.textColor,
    required this.onTap,
    this.verticalPadding,
    this.horizontalPadding,
    this.height,
    this.width,
  });

  final String? icon;
  final String text;
  final Color color;
  final Color textColor;
  final Function() onTap;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding ?? 10,
            horizontal: horizontalPadding ?? 16,
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null ? SvgIcon(icon: icon!) : const SizedBox(),
              icon != null ? const HSpace(5) : const SizedBox(),
              TextWidget(
                text: text,
                fontSize: 14.sp,
                textColor: textColor,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
