import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/screens/request/widgets/user_details_slider_sheet.dart';
import 'package:trakyo_admin/widgets/button_widget.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/text_field_widget.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

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
                          text: 'User',
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
                                    text: 'Name',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  const HSpace(138),
                                  TextWidget(
                                    text: 'Vehicle',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  const HSpace(70),
                                  TextWidget(
                                    text: 'Owner Number',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  const HSpace(95),
                                  TextWidget(
                                    text: 'QR Status',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  const HSpace(90),
                                  TextWidget(
                                    text: 'Mail',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  const Spacer(),
                                  TextWidget(
                                    text: 'Action',
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
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  SideSheet.right(
                                    width: 400.w,
                                    body: const UserDetailsSliderSheet(),
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
                                      SizedBox(
                                        width: 120.w,
                                        child: TextWidget(
                                          text: 'javad ali khan 1255',
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      const HSpace(70),
                                      TextWidget(
                                        text: 'Nil',
                                        fontSize: 14.sp,
                                      ),
                                      const HSpace(84),
                                      TextWidget(
                                        text: '+91-89089 08901',
                                        fontSize: 14.sp,
                                      ),
                                      const HSpace(100),
                                      TextWidget(
                                        text: '2 pcs',
                                        fontSize: 14.sp,
                                      ),
                                      const HSpace(100),
                                      SizedBox(
                                        width: 160.w,
                                        child: TextWidget(
                                          text: 'qwerty1232@gmail.com',
                                          fontSize: 14.sp,
                                          maxLines: 1,
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 1.h,
                                          horizontal: 15.w,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.primaryColor,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: TextWidget(
                                          text: 'Message',
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          textColor: AppColors.primaryColor,
                                        ),
                                      ),
                                      const HSpace(20),
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
