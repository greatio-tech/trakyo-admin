import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class TextFiledWidget extends StatelessWidget {
  const TextFiledWidget({
    super.key,
    this.headingText = '',
    this.hintText,
    this.controller,
    this.isEnable = true,
    this.prefixIcon,
    this.maxLines = 1,
    this.keyboardType,
    this.onTap,
    this.autofocus = false,
    this.buildCounter,
    this.maxLength,
    this.validator,
    this.inputFormatters,
    this.onChanged,
    this.readOnly = false,
    this.height = 56,
    this.disableHeight = false,
    this.textCapitalization = TextCapitalization.none,
  });

  final String? headingText;
  final String? hintText;
  final TextEditingController? controller;
  final bool? isEnable;
  final Widget? prefixIcon;
  final int? maxLines;
  final TextInputType? keyboardType;
  final bool readOnly;
  final Function()? onTap;
  final Function(String)? onChanged;
  final bool autofocus;
  final InputCounterWidgetBuilder? buildCounter;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final String? Function(String?)? validator;
  final double height;
  final bool disableHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headingText == ''
            ? const SizedBox()
            : TextWidget(
                text: headingText ?? '',
                fontSize: 12.sp,
              ),
        headingText == '' ? const SizedBox() : const VSpace(8),
        GestureDetector(
          onTap: onTap,
          child: SizedBox(
            height: disableHeight ? null : height,
            child: TextFormField(
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              textCapitalization: textCapitalization,
              inputFormatters: inputFormatters,
              validator: validator,
              maxLength: maxLength,
              autofocus: autofocus,
              keyboardType: keyboardType,
              readOnly: readOnly,
              enabled: isEnable,
              controller: controller,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.fromLTRB(15, 15, 10, 15),
                filled: true,
                fillColor: Colors.white,
                hintText: hintText,
                enabledBorder: outlineInputBorder(color: Colors.grey.shade300),
                focusedBorder: outlineInputBorder(borderWidth: 2),
                disabledBorder:
                    outlineInputBorder(color: AppColors.lightGreyColor),
                hintStyle: TextStyle(
                  fontFamily: AppConstants.fontFamily,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.normal,
                  color: AppColors.hintTextColor,
                ),
                prefixIcon: prefixIcon,
              ),
              onChanged: onChanged,
              buildCounter: buildCounter,
              maxLines: maxLines,
              style: TextStyle(
                fontFamily: AppConstants.fontFamily,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textBlackColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder outlineInputBorder(
      {Color color = AppColors.primaryColor, double borderWidth = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color,
        width: borderWidth,
      ),
    );
  }
}
