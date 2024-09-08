import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class QrDesign extends StatelessWidget {
  const QrDesign({super.key, required this.qrUrl});
  final String qrUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(60),
        child: Center(
          child: Material(
            borderRadius: BorderRadius.circular(20),
            elevation: 10,
            child: Container(
              width: 450,
              height: 780,
              child: Column(
                children: [
                  const VSpace(60),
                  const SvgIcon(
                    icon: 'assets/svg/trakyo logo.svg',
                    width: 140,
                  ),
                  const VSpace(10),
                  const TextWidget(
                    text: 'SCAN ME!',
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                  const TextWidget(
                    text: 'Scan ◦ Connect ◦ Notify',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  const VSpace(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 30),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const TextWidget(
                          text: 'ANDROID',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          textColor: AppColors.textWhiteColor,
                        ),
                      ),
                      const HSpace(5),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 50),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const TextWidget(
                          text: 'IOS',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          textColor: AppColors.textWhiteColor,
                        ),
                      ),
                    ],
                  ),
                  const VSpace(20),
                  const TextWidget(
                    text: 'www.trakyo.com',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(40),
                    width: 450,
                    // height: 520.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        const TextWidget(
                          text: 'Scan this to contact owner',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          textColor: AppColors.textWhiteColor,
                        ),
                        const VSpace(20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image(
                              image: NetworkImage(
                                qrUrl,
                              ),
                            ),
                          ),
                        ),
                        const VSpace(20),
                        const CustomRichText(
                          textSpans: [
                            TextSpan(
                                text: "Powered by ",
                                style: TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontSize: 14,
                                  color: AppColors.textWhiteColor,
                                )),
                            const TextSpan(
                              text: 'Trakyo scan',
                              style: TextStyle(
                                fontFamily: AppConstants.fontFamily,
                                fontSize: 14,
                                color: AppColors.textWhiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
