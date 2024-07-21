import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trakyo_admin/core/constant.dart';

//********** Vertical Space ************* */

class VSpace extends StatelessWidget {
  const VSpace(this.height, {super.key});
  final double height;
  @override
  Widget build(BuildContext context) => SizedBox(height: height.h);
}

//********** Horizontal Space ************* */

class HSpace extends StatelessWidget {
  const HSpace(this.width, {super.key});
  final double width;
  @override
  Widget build(BuildContext context) => SizedBox(width: width.w);
}

//********** Loading Indicator ************* */

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key, this.color});

  final Color? color;
  @override
  Widget build(BuildContext context) => CircularProgressIndicator.adaptive(
        backgroundColor: color ?? Colors.white,
        // valueColor: AlwaysStoppedAnimation(
        //   AppColors.primaryColor,
        // ),
        strokeWidth: 2,
      );
}

//********** Svg Icon ************* */

class SvgIcon extends StatelessWidget {
  const SvgIcon({
    super.key,
    required this.icon,
    this.height,
    this.width,
    this.fit,
  });

  final String icon;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
        icon,
        height: height,
        width: width,
        fit: fit ?? BoxFit.contain,
      );
}

//-----------------------images-------------------------------

Widget cachedNetworkImage({
  required String imageUrl,
  double? width,
  double? height,
  BoxFit? fit,
  Duration? fadeInDuration,
  String? cacheKey,
  Alignment? alignment,
}) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    cacheKey: cacheKey ?? imageUrl,
    width: width,
    height: height,
    fit: fit,
    fadeInDuration: fadeInDuration ?? const Duration(milliseconds: 300),
    alignment: alignment ?? Alignment.center,
  );
}

//********** Rich Text ************* */

class CustomRichText extends StatelessWidget {
  final List<TextSpan> textSpans;
  final TextAlign textAlign;
  final TextDirection textDirection;
  // final double textScaleFactor;
  final int maxLines;
  final TextOverflow overflow;

  const CustomRichText({
    super.key,
    required this.textSpans,
    this.textAlign = TextAlign.start,
    this.textDirection = TextDirection.ltr,
    this.maxLines = 1,
    this.overflow = TextOverflow.clip,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: textSpans,
        style: customTextStyle(),
      ),
      textAlign: textAlign,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  customTextStyle(
      {Color? textColor,
      double fontSize = 14,
      FontWeight fontWeight = FontWeight.normal}) {
    return TextStyle(
      color: textColor ?? AppColors.textBlackColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: AppConstants.fontFamily,
      overflow: overflow,
    );
  }
}

//-----------------------Blue Gradient Container-------------------------------
class BlueGradientContainer extends StatelessWidget {
  const BlueGradientContainer({
    super.key,
    this.height,
    this.childWidget,
  });
  final double? height;
  final Widget? childWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: height?.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(255, 2, 57, 152),
            Color.fromARGB(225, 4, 97, 254),
          ],
        ),
      ),
      child: childWidget,
    );
  }
}

AppBar appBar(
    {Widget? leading,
    String? title,
    bool? showBackButton,
    List<Widget>? actions,
    Widget? titleWidget,
    Color? backgroundColor,
    bool? centerTitle,
    double? elevation,
    VoidCallback? onBackPress,
    PreferredSizeWidget? bottom,
    double? leadingWidth,
    double? toolbarHeight}) {
  return AppBar(
    elevation: elevation,
    surfaceTintColor: Colors.white,
    automaticallyImplyLeading: showBackButton ?? true,
    leading: leading ??
        (showBackButton ?? true
            ? Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: AppBackButton(
                  onTap: onBackPress,
                  size: 32.h,
                ),
              )
            : null),
    title: titleWidget ??
        (title != null
            ? Text(title,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600))
            : null),
    centerTitle: centerTitle ?? true,
    actions: actions,
    leadingWidth: leadingWidth ?? 52.w,
    backgroundColor: backgroundColor ?? Colors.transparent,
    toolbarHeight: toolbarHeight,
    bottom: bottom,
  );
}

//********** Back Button ************* */

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, this.onTap, this.size, this.icon});
  final double? size;
  final VoidCallback? onTap;
  final String? icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            Get.back();
          },
      child: SvgIcon(
        icon: icon ?? "assets/svg/back_button.svg",
        height: size,
        width: size,
      ),
    );
  }
}

// //********** Date picker ************* */

// Future<dynamic> datePicker(BuildContext context,
//     {String? title,
//     required Function onDatePicked,
//     DateTime? initialDateTime}) {
//   DateTime selectedDate = initialDateTime ??
//       DateTime(
//           DateTime.now().year - 18, DateTime.now().month, DateTime.now().day);

//   return showCupertinoModalPopup(
//     context: context,
//     builder: (context) {
//       return Material(
//         color: Colors.transparent,
//         child: Container(
//           height: 300.h,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20.r),
//               topRight: Radius.circular(20.r),
//             ),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 5.h),
//                 child: Row(
//                   children: [
//                     TextWidget(
//                       textColor: AppColors.textBlackColor,
//                       text: title ?? '',
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20.sp,
//                     ),
//                     const Spacer(),
//                     Button(
//                       text: const TextWidget(
//                         text: "Done",
//                         textColor: AppColors.textBlackColor,
//                       ),
//                       onPress: () {
//                         onDatePicked(selectedDate);
//                         Get.back();
//                       },
//                       backgroundColor: AppColors.primaryColor.withOpacity(0.2),
//                       height: 35.h,
//                       width: 75.w,
//                     )
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: CupertinoDatePicker(
//                   onDateTimeChanged: (value) => selectedDate = value,
//                   minimumYear: DateTime.now().year - 90,
//                   initialDateTime: initialDateTime ??
//                       DateTime(DateTime.now().year - 18, DateTime.now().month,
//                           DateTime.now().day),
//                   maximumDate: DateTime.now(),
//                   mode: CupertinoDatePickerMode.date,
//                   maximumYear: DateTime.now().year,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key, required this.child, required this.tag});
  final Widget child;
  final Object tag;
  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: tag,
        child: Material(type: MaterialType.transparency, child: child));
  }
}
