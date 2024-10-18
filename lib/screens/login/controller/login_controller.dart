import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trakyo_admin/routes.dart';
import 'package:trakyo_admin/services/api_endpoints.dart';
import 'package:trakyo_admin/services/api_exception.dart';
import 'package:trakyo_admin/services/api_service.dart';
import 'package:trakyo_admin/services/local_storage_service.dart';
import 'package:trakyo_admin/utils/utils.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool loginLoading = false.obs;
  RxBool isAuthenticated = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  Future checkLoginStatus() async {
    bool isLogin = await LocalStorage().isLogin();
    print("LoginCheck:-------- $isLogin");

    if (isLogin) {
      isAuthenticated(true);
    } else {
      isAuthenticated(false);
    }
  }

  Future<DioResponse> loginService() async {
    return ApiServices().postMethod(
      ApiEndpoints.login,
      data: {
        "email": emailController.text.toLowerCase(),
        "password": passwordController.text,
      },
    );
  }

  Future userRegistration() async {
    loginLoading(true);
    loginService().then((value) async {
      if (value.statusCode == 201 || value.statusCode == 200) {
        LocalStorage().setLogin();
        final String token = value.data['token'];
        LocalStorage().saveToken(token);
        await checkLoginStatus();
        Get.toNamed(Routes.dashboard);
      } else {
        log(ApiException(value.data['message']).toString());
      }
    }).onError(
      (error, _) {
        log(_.toString());
        Utils.showError(error);
      },
    ).whenComplete(
      () => loginLoading(false),
    );
  }

  Future logout() async {
    clearToken();
    Get.offAllNamed(Routes.login);
  }

  clearToken() async {
    ApiServices.token = null;
    await LocalStorage().setSignOut();
  }
}
