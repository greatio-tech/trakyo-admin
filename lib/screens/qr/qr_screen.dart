import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/screens/qr/controller/qr_controller.dart';
import 'package:trakyo_admin/screens/qr/model/qr_model.dart';
import 'package:trakyo_admin/screens/qr/widgets/qr_details_widget.dart';
import 'package:trakyo_admin/widgets/button_widget.dart';
import 'package:trakyo_admin/widgets/confirm_dialog.dart';
import 'package:trakyo_admin/widgets/filter_chip_widget.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/status_chip_widget.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class QrScreen extends GetWidget<QrController> {
  const QrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => controller.qrGet());
    return Obx(
      () => Expanded(
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
                          // const Spacer(),
                          // SizedBox(
                          //   width: 251.w,
                          //   child: const TextFiledWidget(
                          //     hintText: 'Search',
                          //     prefixIcon: Padding(
                          //       padding: EdgeInsets.all(10),
                          //       child: SvgIcon(
                          //         icon: 'assets/svg/search.svg',
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // const HSpace(16),
                          // Container(
                          //   padding: const EdgeInsets.all(8),
                          //   decoration: BoxDecoration(
                          //     color: Colors.white,
                          //     borderRadius: BorderRadius.circular(6),
                          //   ),
                          //   child: const SvgIcon(
                          //     icon: 'assets/svg/bell.svg',
                          //   ),
                          // ),
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
                          // ButtonWidget(
                          //   icon: 'assets/svg/Export.svg',
                          //   text: 'Export data',
                          //   color: AppColors.primaryColor.withOpacity(0.2),
                          //   textColor: AppColors.primaryColor,
                          //   onTap: () {},
                          // ),
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
                                                icon:
                                                    'assets/svg/Arrow Left.svg',
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
                                            MainAxisAlignment.start,
                                        children: [
                                          // Expanded(
                                          //   child: Column(
                                          //     crossAxisAlignment:
                                          //         CrossAxisAlignment.start,
                                          //     children: [
                                          //       TextWidget(
                                          //         text: 'User',
                                          //         fontSize: 12.sp,
                                          //       ),
                                          //       const VSpace(8),
                                          //       const TextFiledWidget(),
                                          //     ],
                                          //   ),
                                          // ),
                                          // const HSpace(10),
                                          SizedBox(
                                            width: 180.w,
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
                                                        color: Colors
                                                            .grey.shade300),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: TextFormField(
                                                          inputFormatters: [
                                                            FilteringTextInputFormatter
                                                                .digitsOnly
                                                          ],
                                                          cursorHeight: 15.sp,
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          textAlign:
                                                              TextAlign.center,
                                                          decoration:
                                                              InputDecoration(
                                                            prefixIcon:
                                                                GestureDetector(
                                                              onTap: () {
                                                                if (controller
                                                                        .qrCount
                                                                        .value >
                                                                    1) {
                                                                  controller
                                                                      .qrCount
                                                                      .value--;
                                                                  controller
                                                                          .qrCountController
                                                                          .text =
                                                                      controller
                                                                          .qrCount
                                                                          .value
                                                                          .toString();
                                                                }
                                                              },
                                                              child:
                                                                  const SvgIcon(
                                                                icon:
                                                                    'assets/svg/Minus Square.svg',
                                                              ),
                                                            ),
                                                            suffixIcon:
                                                                GestureDetector(
                                                              onTap: () {
                                                                controller
                                                                    .qrCount
                                                                    .value++;

                                                                controller
                                                                        .qrCountController
                                                                        .text =
                                                                    controller
                                                                        .qrCount
                                                                        .value
                                                                        .toString();
                                                              },
                                                              child:
                                                                  const SvgIcon(
                                                                icon:
                                                                    'assets/svg/plus square.svg',
                                                              ),
                                                            ),
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                          controller: controller
                                                              .qrCountController,
                                                          onChanged: (value) {
                                                            controller.qrCount(
                                                              int.parse(
                                                                value,
                                                              ),
                                                            );
                                                          },
                                                        ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          ButtonWidget(
                                            verticalPadding: 5.h,
                                            width: 120.w,
                                            text: 'Cancel',
                                            color: AppColors.errorColor
                                                .withOpacity(.2),
                                            textColor: AppColors.errorColor,
                                            onTap: () {
                                              Get.back();
                                            },
                                          ),
                                          const HSpace(16),
                                          ButtonWidget(
                                            verticalPadding: 5.h,
                                            width: 120.w,
                                            text: 'Add',
                                            color: AppColors.primaryColor,
                                            textColor: AppColors.textWhiteColor,
                                            onTap: () {
                                              controller.generateQr();
                                            },
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
                      const VSpace(24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                FilterChip1(
                                  controller: controller,
                                  position: 0,
                                  text: "All",
                                ),
                                FilterChip1(
                                  controller: controller,
                                  position: 1,
                                  text: "Linked",
                                ),
                                FilterChip1(
                                  controller: controller,
                                  position: 2,
                                  text: 'Not Linked',
                                ),
                              ],
                            ),
                          )
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
                                    // Checkbox(
                                    //   activeColor: AppColors.primaryColor,
                                    //   value: true,
                                    //   onChanged: (value) {},
                                    // ),
                                    // const HSpace(5),
                                    TextWidget(
                                      text: 'QR ID',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    const HSpace(90),
                                    TextWidget(
                                      text: 'User',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    const HSpace(170),
                                    TextWidget(
                                      text: 'Vehicle',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    const HSpace(125),
                                    TextWidget(
                                      text: 'Owner Number',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    const Spacer(),
                                    //
                                    TextWidget(
                                      text: 'Emergency Number',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    const HSpace(120),
                                    TextWidget(
                                      text: 'Status',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                    ),

                                    SizedBox(
                                      width: 70.w,
                                    )
                                  ],
                                ),
                              ),
                              QrList(
                                controller: controller,
                                qrList: controller.currentIndex.value == 0
                                    ? controller.qrList
                                    : controller.currentIndex.value == 1
                                        ? controller.qrListLinked
                                        : controller.qrListNotLinked,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // const VSpace(40),
                      // Row(
                      //   children: [
                      //     TextWidget(
                      //       text: "Show of 1 to 11 of 43 rows",
                      //       fontSize: 14.sp,
                      //       textColor: AppColors.textGreyColor,
                      //     ),
                      //     Container()
                      //   ],
                      // )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QrList extends StatelessWidget {
  const QrList({
    super.key,
    required this.controller,
    required this.qrList,
  });

  final QrController controller;
  final List<QrModel> qrList;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
        separatorBuilder: (context, index) {
          return Container(
            height: 2,
            color: const Color(0xFFF5F5F5),
          );
        },
        itemCount: qrList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              if (qrList[index].vehicleDetails.vehicleLink == true) {
                controller.setQrDetails(index);
                SideSheet.right(
                  width: 400.w,
                  body: QrDetailsWidget(
                    qrList[index].id,
                    qrList[index].code,
                  ),
                  context: context,
                );
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
              child: Row(
                children: [
                  // Checkbox(
                  //   activeColor: AppColors.primaryColor,
                  //   value: true,
                  //   onChanged: (value) {},
                  // ),
                  // const HSpace(5),
                  SizedBox(
                    width: 50.w,
                    child: TextWidget(
                      text: qrList[index]
                          .id
                          .substring(qrList[index].id.length - 5)
                          .toUpperCase(),
                      fontSize: 14.sp,
                    ),
                  ),
                  const HSpace(75),
                  SizedBox(
                    width: 120.w,
                    child: TextWidget(
                      text: qrList[index].owner.name,
                      fontSize: 14.sp,
                    ),
                  ),
                  const HSpace(84),
                  SizedBox(
                    width: 100.w,
                    child: TextWidget(
                      text: qrList[index].vehicleDetails.licensePlate,
                      fontSize: 14.sp,
                    ),
                  ),
                  const HSpace(70),
                  SizedBox(
                    width: 120.w,
                    child: TextWidget(
                      text: qrList[index].owner.phoneNumber,
                      fontSize: 14.sp,
                    ),
                  ),
                  // const HSpace(80),
                  const Spacer(),
                  SizedBox(
                    width: 120.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: qrList[index].emergencyContacts.isNotEmpty
                              ? qrList[index].emergencyContacts[0].phoneNumber
                              : '',
                          fontSize: 14.sp,
                          maxLines: 2,
                        ),
                        qrList[index].emergencyContacts.length > 1
                            ? TextWidget(
                                text: qrList[index]
                                    .emergencyContacts[1]
                                    .phoneNumber,
                                fontSize: 14.sp,
                                maxLines: 2,
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  // const Spacer(),
                  const HSpace(110),
                  StatusChipWidget(
                    status: qrList[index].vehicleDetails.vehicleLink == false
                        ? "not linked"
                        : 'linked',
                  ),
                  const HSpace(10),
                  Row(
                    children: [
                      Visibility(
                        visible:
                            qrList[index].vehicleDetails.vehicleLink == false,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              Get.dialog(
                                ConfirmDialog(
                                  description:
                                      'Are you sure you want to delete this QR?',
                                  title: 'Delete QR',
                                  onConfirm: () {
                                    controller.deleteQr(
                                      qrList[index].id,
                                    );
                                  },
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      const HSpace(5),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () async {
                            await QrController.to.createPdf(
                              qrList[index].qrCodeData,
                              qrList[index]
                                  .code
                                  .substring(qrList[index].code.length - 5)
                                  .toUpperCase(),
                            );
                            ScaffoldMessenger.of(Get.context!).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "PDF Generated and Downloaded!",
                                ),
                              ),
                            );
                          },
                          child: const SvgIcon(
                            icon: 'assets/svg/print.svg',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
