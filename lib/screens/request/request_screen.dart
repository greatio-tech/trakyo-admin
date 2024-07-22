import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/widgets/button_widget.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/text_field_widget.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

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
                          text: 'Request',
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
                                  const HSpace(32),
                                  TextWidget(
                                    text: 'User',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  const HSpace(100),
                                  TextWidget(
                                    text: 'Topic',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  const HSpace(142),
                                  TextWidget(
                                    text: 'Description',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  const HSpace(370),
                                  TextWidget(
                                    text: 'Date raised',
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
                            ListView.separated(
                              separatorBuilder: (context, index) {
                                return Container(
                                  height: 2,
                                  color: const Color(0xFFF5F5F5),
                                );
                              },
                              itemCount: 8,
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
                                    const HSpace(32),
                                    TextWidget(
                                      text: 'User $index',
                                      fontSize: 14.sp,
                                    ),
                                    const HSpace(90),
                                    SizedBox(
                                      width: 100.w,
                                      child: TextWidget(
                                        text: 'QR $index',
                                        fontSize: 14.sp,
                                      ),
                                    ),

                                    const HSpace(80),
                                    Expanded(
                                      flex: 4,
                                      child: TextWidget(
                                        text:
                                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    const HSpace(150),
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
                                    // const HSpace(10),
                                    // MouseRegion(
                                    //   cursor: SystemMouseCursors.click,
                                    //   child: GestureDetector(
                                    //     onTap: () {},
                                    //     child: const SvgIcon(
                                    //       icon: 'assets/svg/print.svg',
                                    //     ),
                                    //   ),
                                    // )
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
