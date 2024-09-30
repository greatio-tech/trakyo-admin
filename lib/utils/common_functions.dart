import 'dart:developer';

import 'package:trakyo_admin/services/api_exception.dart';
import 'package:trakyo_admin/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:flutter/services.dart';

class CommonFunctions {
  CommonFunctions._();
  static validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  static validateOtp(String value) {
    if (value.isEmpty || value.length != 6) {
      return 'Please enter OTP';
    }
    return null;
  }

  static validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);
    if (value!.isEmpty) {
      return 'Please enter email address';
    }

    return value.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  static void launchUrl(String url, {bool addPrefix = false}) async {
    if (addPrefix &&
        (!(url.startsWith('http://') || url.startsWith('https://')))) {
      url = 'https://$url';
    }
    log('launch url: $url');
    if (!await url_launcher.launchUrl(Uri.parse(url),
        mode: url_launcher.LaunchMode.externalApplication)) {
      Utils.showError(const ApiException('Cannot launch url'));
    }
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
