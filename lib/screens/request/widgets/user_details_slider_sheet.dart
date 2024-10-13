import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/screens/user/controller/users_controller.dart';
import 'package:trakyo_admin/widgets/pref_tile.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/reuse_datePicker.dart';
import 'package:trakyo_admin/widgets/text_field_widget.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class UserDetailsSliderSheet extends GetWidget<UsersController> {
  const UserDetailsSliderSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () {
          if (controller.getUserByUserIdLoading.value) {
            return const Center(
                heightFactor: 30,
                child:
                    SizedBox(height: 30, width: 30, child: LoadingIndicator()));
          }
          return Container(
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
                      text: 'User details',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
                const VSpace(25),
                TextWidget(
                  text: "Profile",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
                const VSpace(8),
                SvgIcon(
                  icon: "assets/svg/profile_avatar.svg",
                  height: 98.h,
                  width: 98.h,
                ),
                const VSpace(16),
                Row(
                  children: [
                    TextWidget(
                      text: "Full Name",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    const Spacer(),
                    Obx(
                      () => Visibility(
                        visible: !controller.userNameEditLoading.value,
                        replacement: const SizedBox(
                          height: 20,
                          width: 20,
                          child: LoadingIndicator(),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            !controller.isUserNameEditable.value
                                ? controller.isUserNameEditable.value =
                                    !controller.isUserNameEditable.value
                                : controller.editUserName();
                          },
                          child: TextWidget(
                            text: !controller.isUserNameEditable.value
                                ? "Edit"
                                : "Save",
                            fontSize: 12.sp,
                            textColor: AppColors.primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const VSpace(8),
                TextFiledWidget(
                  controller: controller.fullNameController,
                  readOnly: !controller.isUserNameEditable.value ? true : false,
                  height: 56.h,
                ),
                const VSpace(16),
                TextWidget(
                  text: "Mobile Number",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
                const VSpace(8),
                TextFiledWidget(
                  controller: TextEditingController(
                      text: controller.userData.value!.phoneNumber),
                  readOnly: true,
                  height: 56.h,
                ),
                const VSpace(16),
                Row(
                  children: [
                    TextWidget(
                      text: "Mail",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    const Spacer(),
                    Obx(
                      () => Visibility(
                        visible: !controller.userEmailEditLoading.value,
                        replacement: const SizedBox(
                          height: 20,
                          width: 20,
                          child: LoadingIndicator(),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            !controller.isEmailEditable.value
                                ? controller.isEmailEditable.value =
                                    !controller.isEmailEditable.value
                                : controller.editEmail();
                          },
                          child: TextWidget(
                            text: !controller.isEmailEditable.value
                                ? "Edit"
                                : "Save",
                            fontSize: 12.sp,
                            textColor: AppColors.primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const VSpace(8),
                TextFiledWidget(
                  controller: controller.emailController,
                  readOnly: !controller.isEmailEditable.value ? true : false,
                  height: 56.h,
                ),
                const VSpace(16),
                Obx(
                  () => Visibility(
                    visible: !controller.isDobEditable.value,
                    replacement: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "DOB",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        const VSpace(8),
                        ReusableDatePicker(
                          onSave: (p0) {
                            controller.editDOB(p0);
                          },
                          initialDate:
                              controller.userData.value?.dob ?? DateTime.now(),
                          firstDate: DateTime(1920),
                          lastDate: DateTime.now(),
                          dateFormat: 'dd-MM-yyyy',
                          selectDateButtonText: 'Choose Date',
                          saveButtonText: 'Confirm',
                          loading: controller.userDOBLoading.value,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextWidget(
                              text: "DOB",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                controller.isDobEditable.value =
                                    !controller.isDobEditable.value;
                              },
                              child: TextWidget(
                                text: "Edit",
                                fontSize: 12.sp,
                                textColor: AppColors.primaryColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const VSpace(8),
                        TextFiledWidget(
                          controller: TextEditingController(
                              text: DateFormat('dd-MM-yyyy').format(
                                  controller.userData.value?.dob ??
                                      DateTime.now())),
                          readOnly: true,
                          height: 56.h,
                        ),
                      ],
                    ),
                  ),
                ),
                const VSpace(32),
                TextWidget(
                  text: "User QR",
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                ),
                const VSpace(24),
                if (controller.userData.value!.qrCodes.isEmpty)
                  const TextWidget(text: "No user Qr found"),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return PrefTile.more(
                          // title: controller.userData.value!.qrCodes[index]
                          //             .vehicleDetails ==
                          //         null
                          //     ? "Not Linked"
                          //     : (controller.userData.value!.qrCodes[index]
                          //             .vehicleDetails!.make +
                          //         controller.userData.value!.qrCodes[index]
                          //             .vehicleDetails!.model),
                          title: controller.userData.value!.qrCodes[index]
                                      .vehicleDetails ==
                                  null
                              ? "Not Linked"
                              : controller.vehicleNameById(controller.userData
                                  .value!.qrCodes[index].vehicleDetails!)!,
                          subtitle:
                              controller.userData.value!.qrCodes[index].id,
                          leading: const SvgIcon(
                              icon: "assets/svg/qr_code_round.svg"),
                          titleStyle: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textGreyColor,
                          ),
                          minHeight: true,
                          subTitleStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textBlackColor,
                          ),
                          onTap: () {});
                    },
                    separatorBuilder: (context, index) => const VSpace(16),
                    itemCount: controller.userData.value!.qrCodes.length),
                const VSpace(32),
                TextWidget(
                  text: "User Vehicle",
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                ),
                const VSpace(24),
                if (controller.userData.value!.vehicles.isEmpty)
                  const TextWidget(text: "No user vehicle found"),
                ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return PrefTile.more(
                          title:
                              "${controller.userData.value!.vehicles[index].make} ${controller.userData.value!.vehicles[index].model}",
                          subtitle: controller
                              .userData.value!.vehicles[index].licensePlate,
                          titleStyle: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textGreyColor,
                          ),
                          subTitleStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textBlackColor,
                          ),
                          minHeight: true,
                          onTap: () {});
                    },
                    separatorBuilder: (context, index) => const VSpace(16),
                    itemCount: controller.userData.value!.vehicles.length)
              ],
            ),
          );
        },
      ),
    );
  }
}
