import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/screens/products/controller/products_controller.dart';
import 'package:trakyo_admin/widgets/button_widget.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/text_field_widget.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class ProductsScreen extends GetWidget<ProductsController> {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => ListView(
          padding: const EdgeInsets.all(20),
          children: [
            ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return const VSpace(20);
              },
              shrinkWrap: true,
              itemCount: controller.productsList.length,
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: ListTile(
                  onTap: () {
                    controller.setData(index);
                    SideSheet.right(
                      width: 400.w,
                      body: SingleChildScrollView(
                        padding: const EdgeInsets.all(20),
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
                                  text: 'Product Details',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            ),
                            const VSpace(24),
                            TextFiledWidget(
                              controller: controller.nameController,
                              headingText: "Product Name",
                            ),
                            const VSpace(10),
                            TextFiledWidget(
                              controller: controller.descriptionController,
                              headingText: "Product description",
                            ),
                            const VSpace(10),
                            TextFiledWidget(
                              controller: controller.priceController,
                              headingText: "Product price",
                            ),
                            const VSpace(10),
                            GestureDetector(
                              onTap: () {
                                controller.pickImage();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.add_box_rounded,
                                      color: AppColors.primaryColor,
                                      size: 40.h,
                                    ),
                                    const VSpace(5),
                                    TextWidget(
                                      text: "Add Images",
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const VSpace(24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 100.w,
                                  child: ButtonWidget(
                                    text: 'Update',
                                    color: AppColors.primaryColor,
                                    textColor: AppColors.textWhiteColor,
                                    onTap: () {
                                      controller.updateProducts(
                                        controller.productsList[index].id,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      context: context,
                    );
                  },
                  title: TextWidget(
                    text: controller.productsList[index].name,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  subtitle: TextWidget(
                    text: "₹ ${controller.productsList[index].price}",
                    fontSize: 12.sp,
                    textColor: AppColors.textGreyColor,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
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
