import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/text_field_widget.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
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
                const DashboardBt(
                  icon: 'assets/svg/chart.svg',
                  text: 'Over View',
                ),
                const VSpace(32),
                const DashboardBt(
                  icon: 'assets/svg/QR Code.svg',
                  text: 'QR',
                ),
                const VSpace(32),
                const DashboardBt(
                  icon: 'assets/svg/User Tag.svg',
                  text: 'Request',
                ),
                const VSpace(32),
                const DashboardBt(
                  icon: 'assets/svg/Bag Check.svg',
                  text: 'Sales',
                ),
                const VSpace(32),
                const DashboardBt(
                  icon: 'assets/svg/User.svg',
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
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    const HSpace(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: 'Leo',
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
          Expanded(
            child: Container(
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
                            text: 'Overview',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 251.w,
                            child: const TextFiledWidget(
                              hintText: 'Search',
                              prefixIcon: SvgIcon(
                                icon: 'assets/svg/search.svg',
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
                          )
                        ],
                      ),
                      const VSpace(40),
                      TextWidget(
                        text: 'Hello Shameer 👋🏻',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      const VSpace(4),
                      TextWidget(
                        text: 'Check out latest update!',
                        fontSize: 14.sp,
                        textColor: AppColors.textGreyColor,
                      ),
                      const VSpace(24),
                      const Row(
                        children: [
                          Cards(
                            icon: 'assets/svg/double profile.svg',
                            text: 'Total User',
                            richText1: '40,000 ',
                            richText2: 'Users',
                          ),
                          HSpace(32),
                          Cards(
                            icon: 'assets/svg/Qr blue.svg',
                            text: 'Total QR',
                            richText1: '40,689 ',
                            richText2: 'Activated QR',
                          ),
                          HSpace(32),
                          Expanded(
                            child: Cards(
                              icon: 'assets/svg/bag blue.svg',
                              text: 'New QR sales',
                              richText1: '40,689 ',
                              richText2: 'Activated QR',
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Cards extends StatelessWidget {
  const Cards({
    super.key,
    required this.icon,
    required this.text,
    required this.richText1,
    required this.richText2,
  });

  final String icon;
  final String text;
  final String richText1;
  final String richText2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 120.w, 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgIcon(
            icon: icon,
          ),
          const VSpace(17),
          TextWidget(
            text: text,
            fontSize: 14.sp,
            textColor: AppColors.textGreyColor,
          ),
          const VSpace(10),
          CustomRichText(
            textSpans: [
              TextSpan(
                text: richText1,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: AppConstants.fontFamily,
                ),
              ),
              TextSpan(
                text: richText2,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class DashboardBt extends StatelessWidget {
  const DashboardBt({
    super.key,
    required this.icon,
    required this.text,
  });

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          SvgIcon(icon: icon),
          const HSpace(8),
          TextWidget(
            text: text,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          )
        ],
      ),
    );
  }
}
