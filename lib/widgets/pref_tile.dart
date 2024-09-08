import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trakyo_admin/core/constant.dart';
import 'package:trakyo_admin/widgets/reusable_widgets.dart';
import 'package:trakyo_admin/widgets/text_widget.dart';

class PrefTile<T> extends StatelessWidget {
  const PrefTile({
    super.key,
    required this.title,
    this.leading,
    this.subtitle,
    this.trailing,
    this.backgroundColor,
    this.onTap,
    this.titleWidget,
    this.titleStyle,
    this.subTitleStyle,
    this.padding,
    this.height,
    this.subTitleSpace,
    this.borderRadius,
    this.maxLines,
    this.child,
    this.childSpacing,
    this.minHeight = false,
    this.leadingSpace,
    this.enableBorder = false,
  });

  PrefTile.switchBox(
      {super.key,
      required this.title,
      this.leading,
      this.subtitle,
      required RxBool checked,
      RxBool? clickable,
      RxBool? enabled,
      void Function(bool val)? onSwitchDisabledClick,
      void Function(bool?)? onChange,
      this.backgroundColor,
      this.titleWidget,
      this.titleStyle,
      this.subTitleStyle,
      this.height,
      this.padding,
      this.subTitleSpace,
      this.maxLines,
      this.borderRadius,
      this.child,
      this.childSpacing,
      this.minHeight = false,
      this.leadingSpace,
      this.enableBorder = false})
      : onTap = null,
        trailing = Obx(() => Transform.scale(
              scale: 0.9,
              child: CupertinoSwitch(
                  value: checked.value,
                  activeColor: AppColors.primaryColor,
                  onChanged: (enabled?.value ?? true)
                      ? (value) {
                          if (clickable?.value == false) return;
                          checked(value);
                          onChange?.call(value);
                        }
                      : onSwitchDisabledClick),
            ));

  PrefTile.radio({
    super.key,
    required this.title,
    required T value,
    required Rxn<T> groupValue,
    this.leading,
    this.subtitle,
    this.backgroundColor,
    this.titleWidget,
    this.titleStyle,
    this.subTitleStyle,
    this.padding,
    this.height,
    this.subTitleSpace,
    this.maxLines,
    this.child,
    this.childSpacing,
    double? radioSize,
    this.minHeight = false,
    this.borderRadius,
    this.leadingSpace,
    this.enableBorder = false,
  })  : onTap = _toggleRadioSelection(groupValue, value),
        trailing = Obx(() {
          return CircleCheckbox(
            value: groupValue.value == value,
            onChanged: null,
            size: radioSize ?? 26.w,
          );
        });

  const PrefTile.more(
      {super.key,
      required this.title,
      required VoidCallback this.onTap,
      this.leading,
      this.subtitle,
      this.backgroundColor,
      this.titleWidget,
      this.titleStyle,
      this.subTitleStyle,
      this.padding,
      this.height,
      this.subTitleSpace,
      this.maxLines,
      this.child,
      this.childSpacing,
      this.borderRadius,
      this.minHeight = false,
      this.leadingSpace,
      this.enableBorder = false})
      : trailing =
            const SvgIcon(icon: "assets/svg/circle_forward_arrow.svg.svg");

  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final Widget? titleWidget;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;
  final EdgeInsets? padding;
  final double? height;
  final double? subTitleSpace;
  final int? maxLines;
  final Widget? child;
  final double? childSpacing;
  final bool minHeight;
  final double? borderRadius;
  final double? leadingSpace;
  final bool enableBorder;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                )
              ],
              border: enableBorder
                  ? Border.all(
                      color: AppColors.primaryColor,
                    )
                  : null,
              color: backgroundColor ?? Colors.white,
              borderRadius: BorderRadius.circular(borderRadius ?? 12.r)),
          height: (minHeight) ? null : 56.h,
          padding: padding ??
              EdgeInsets.only(left: 12.w, right: 16.w, top: 11.h, bottom: 11.h),
          child: Row(
            children: [
              if (leading != null) ...[
                leading!,
                HSpace(leadingSpace ?? 12),
              ],
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleWidget ??
                        TextWidget(
                          text: title,
                          textStyle: titleStyle,
                          fontSize: 14.sp,
                          maxLines: maxLines ?? 1,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w500,
                        ),
                    if (subtitle != null) ...[
                      VSpace(subTitleSpace ?? 0),
                      TextWidget(
                        text: subtitle!,
                        textStyle: subTitleStyle,
                        fontSize: 12.sp,
                        maxLines: 2,
                        textColor: AppColors.textBlackColor.withOpacity(0.5),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                    if (child != null) ...[
                      VSpace(childSpacing ?? 30.sp),
                      child!
                    ]
                  ],
                ),
              ),
              if (trailing != null) ...[const HSpace(15), trailing!]
            ],
          ),
        ),
      ),
    );
  }

  static VoidCallback _toggleRadioSelection(Rxn groupValue, dynamic value) {
    return () => groupValue.value = value;
  }
}

class CircleCheckbox extends StatelessWidget {
  const CircleCheckbox(
      {super.key,
      required this.value,
      required this.onChanged,
      this.size,
      this.color});
  final bool value;
  final Function(bool value)? onChanged;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged?.call(!value);
      },
      child: SvgIcon(
        // iconSize: size,
        icon: value ? 'assets/svg/Radio_on.svg' : 'assets/svg/Radio_off.svg',
        // iconColor: color,
      ),
    );
  }
}
