import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog(
      {super.key,
      required this.title,
      this.cancelText,
      this.confirmText,
      this.onCancel,
      this.onConfirm,
      required this.description});

  final String title;
  final String description;
  final String? cancelText;
  final String? confirmText;
  final VoidCallback? onCancel;
  final VoidCallback? onConfirm;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(brightness: Brightness.light),
      child: AlertDialog(
        title: TextWidget(
          text: title,
          fontSize: 16.sp,
        ),
        content: TextWidget(
          text: description,
          textAlign: TextAlign.center,
          maxLines: 5,
        ),
        actions: [
          _dialogButton(
            text: cancelText ?? 'Cancel',
            onPressed: onCancel ?? () => Get.back(),
          ),
          _dialogButton(
            text: confirmText ?? 'Ok',
            onPressed: () {
              onConfirm?.call();
              // Get.back();
            },
          )
        ],
      ),
    );
  }

  _dialogButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return TextButton(
        onPressed: onPressed,
        child: TextWidget(
          text: text,
          textColor: AppColors.textBlackColor,
          fontWeight: FontWeight.w600,
        ));
  }
}
