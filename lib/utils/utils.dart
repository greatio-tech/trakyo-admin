import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/services/api_exception.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class Utils {
  Utils._();

  //-----------------------Snackbar-------------------------------
  static showError(Object? e, {String? title, IconData? icon}) {
    ApiException exception;
    if (e == null) {
      exception = ApiException.default_;
    } else {
      exception = e is ApiException
          ? e
          : kDebugMode
              ? ApiException('$e', title: 'Unhandled exception')
              : ApiException.default_;
    }
    snackBar(
      title: title ?? exception.title,
      message: exception.message,
      icon: Icon(icon ?? exception.icon),
      backgroundColor: Colors.white,
      indicatorColor: AppColors.errorColor,
    );
  }

  static showSuccess(String message,
      {String? title, Widget? icon, Duration? duration}) {
    snackBar(
      title: title,
      message: message,
      icon: icon ?? const Icon(Icons.check_circle),
      duration: duration,
      indicatorColor: AppColors.successColor,
    );
  }

  static showWarning(String message,
      {String? title,
      Widget? icon,
      Duration? duration,
      Widget? action,
      SnackPosition position = SnackPosition.BOTTOM}) {
    if (Get.isSnackbarOpen) return;
    snackBar(
      title: title ?? 'Warning',
      message: message,
      icon: icon ?? const Icon(Icons.info),
      duration: duration,
      indicatorColor: AppColors.warningColor,
      action: action ?? const SizedBox(),
      position: position,
    );
  }

  static snackBar(
      {required String message,
      Widget? icon,
      Color? indicatorColor,
      String? title,
      Color? backgroundColor,
      Duration? duration,
      Duration? animationDuration,
      SnackPosition position = SnackPosition.BOTTOM,
      Widget? action}) {
    Get.showSnackbar(GetSnackBar(
      backgroundColor: Colors.transparent,
      snackPosition: position,
      duration: duration ?? const Duration(seconds: 3),
      animationDuration: animationDuration ?? const Duration(seconds: 1),
      messageText: IntrinsicHeight(
        child: Material(
          type: MaterialType.card,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(10.r),
          elevation: 4,
          color: Colors.white,
          child: Row(
            children: [
              if (indicatorColor != null)
                VerticalDivider(
                  color: indicatorColor,
                  thickness: 5,
                  width: 5,
                ),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.w),
                  child: Row(
                    children: [
                      if (icon != null) ...[icon, const HSpace(14)],
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (title != null) ...[
                              TextWidget(
                                text: title,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              const VSpace(5),
                            ],
                            TextWidget(
                              text: message,
                              fontSize: 13.sp,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      action ?? const SizedBox()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  static void showToast(String message,
      {bool isDark = true, Color? backgroundColor}) {
    Fluttertoast.showToast(
        textColor: isDark ? AppColors.textWhiteColor : AppColors.textBlackColor,
        msg: message,
        backgroundColor: backgroundColor ??
            (isDark ? Colors.grey.shade800 : AppColors.textWhiteColor));
  }
}
