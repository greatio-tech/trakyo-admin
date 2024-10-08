import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/screens/login/controller/login_controller.dart';
import 'package:trakyo_admin/widgets/button_widget.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/text_field_widget.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 320.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SvgIcon(icon: 'assets/svg/trakyo logo.svg'),
                        const VSpace(32),
                        TextWidget(
                          text: 'Login to your account',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        const VSpace(5),
                        TextWidget(
                          text: 'Welcome back!',
                          fontSize: 14.sp,
                          textColor: AppColors.textGreyColor,
                        ),
                        const VSpace(24),
                        TextFiledWidget(
                          controller: controller.emailController,
                          headingText: 'Mail',
                          hintText: 'Enter your Mail',
                        ),
                        const VSpace(16),
                        TextFiledWidget(
                          controller: controller.passwordController,
                          headingText: 'Password',
                          hintText: 'Enter your password',
                        ),
                        const VSpace(32),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Obx(
                            () => ButtonWidget(
                              isLoading: controller.loginLoading.value,
                              text: 'Login',
                              color: AppColors.primaryColor,
                              textColor: AppColors.textWhiteColor,
                              onTap: () {
                                controller.userRegistration();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const VSpace(220),
                ],
              ),
            ),
            SvgIcon(
              width: 1500.w,
              icon: 'assets/svg/login image.svg',
            )
          ],
        ),
      ),
    );
  }
}
