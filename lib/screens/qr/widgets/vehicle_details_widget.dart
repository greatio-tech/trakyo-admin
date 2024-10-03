import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/screens/qr/controller/qr_controller.dart';
import 'package:trakyo_admin/widgets/button_widget.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/text_field_widget.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class VehicleDetailsWidget extends GetWidget<QrController> {
  const VehicleDetailsWidget({
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
                  text: 'Vehicle Details',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
            const VSpace(24),
            TextWidget(
              text: 'Registration Number',
              fontSize: 12.sp,
            ),
            const VSpace(8),
            TextFiledWidget(
              controller: controller.vehicleRegNumberController,
            ),
            const VSpace(24),
            TextWidget(
              text: 'Vehicle Make',
              fontSize: 12.sp,
            ),
            const VSpace(8),
            TextFiledWidget(
              controller: controller.vehicleMakeController,
            ),
            const VSpace(24),
            TextWidget(
              text: 'Vehicle Model',
              fontSize: 12.sp,
            ),
            const VSpace(8),
            TextFiledWidget(
              controller: controller.vehicleModelController,
            ),
            const VSpace(24),
            TextWidget(
              text: 'Vehicle Type',
              fontSize: 12.sp,
            ),
            const VSpace(8),
            Container(
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                border: controller.vehicleTypeInvalid.value
                    ? const BorderDirectional(
                        bottom: BorderSide(
                          color: Colors.red,
                          width: 1.1,
                        ),
                      )
                    : Border.all(color: AppColors.lightGreyColor),
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              width: double.infinity,
              child:
                  // Obx(
                  //   () =>

                  DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Text(
                    // controller.vehicleType.value == ""
                    //     ?
                    'Select vehicle type',
                    // : controller.vehicleType.value,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),

                  items: controller.vehicleTypes
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Row(
                              children: [
                                Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                const Spacer(),
                                const SvgIcon(
                                    icon:
                                        // item == controller.vehicleType.value
                                        //     ?
                                        'assets/svg/Radio_on.svg'
                                    // : "assets/svg/Radio_off.svg",
                                    )
                              ],
                            ),
                          ))
                      .toList(),
                  // value: controller.vehicleType.value,
                  onChanged: (value) {},
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 45,
                    width: 200,
                  ),
                  dropdownStyleData: const DropdownStyleData(
                    padding: EdgeInsets.all(20),
                    offset: Offset(0, -20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      boxShadow: [],
                    ),
                    maxHeight: 250,
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 50,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: SvgIcon(
                      icon: 'assets/svg/arrow_down.svg',
                    ),
                    openMenuIcon: SvgIcon(
                      icon: 'assets/svg/arrow_up.svg',
                    ),
                  ),
                ),
              ),
              // ),
            ),
            const VSpace(24),
            TextWidget(
              text: 'Owner Name',
              fontSize: 12.sp,
            ),
            const VSpace(8),
            TextFiledWidget(),
            const VSpace(24),
            TextWidget(
              text: 'Owner Mobile number *',
              fontSize: 12.sp,
            ),
            const VSpace(8),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.lightGreyColor),
                  ),
                  child: const SvgIcon(
                    icon: "assets/svg/flag.svg",
                  ),
                ),
                const HSpace(8),
                Expanded(
                  child: TextFiledWidget(
                    keyboardType: TextInputType.number,
                    onChanged: (p0) {
                      if (p0.length == 10) {
                        FocusScope.of(Get.context!).unfocus();
                      }
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                    ],
                  ),
                ),
              ],
            ),
            const VSpace(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonWidget(
                  verticalPadding: 5.h,
                  width: 120.w,
                  text: 'Edit',
                  color: AppColors.primaryColor,
                  textColor: AppColors.textWhiteColor,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
