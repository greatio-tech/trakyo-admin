import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:trakyo_admin/screens/request/widgets/user_details_slider_sheet.dart';
import 'package:trakyo_admin/screens/user/model/users_model.dart';
import 'package:trakyo_admin/services/api_endpoints.dart';
import 'package:trakyo_admin/services/api_exception.dart';
import 'package:trakyo_admin/services/api_service.dart';
import 'package:trakyo_admin/utils/utils.dart';

class UsersController extends GetxController {
  static UsersController get to => Get.find();

  @override
  void onInit() {
    userGet();
    super.onInit();
  }

  RxList<UsersModel> usersList = <UsersModel>[].obs;

  RxBool getUsersLoading = false.obs;
  Future<DioResponse> usersService() async {
    return ApiServices().getMethod(
      ApiEndpoints.users,
    );
  }

  Future userGet() async {
    getUsersLoading(true);

    try {
      final DioResponse response = await usersService(); // await the response

      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        usersList(usersModelFromJson(response.data));
      } else {
        log(ApiException(response.data['message']).toString());
      }
    } catch (error) {
      log(error.toString());
      Utils.showError(error);
    } finally {
      getUsersLoading(false);
    }
  }

  RxBool getUserByUserIdLoading = false.obs;
  Rxn<UsersModel> userData = Rxn();

  Future getUserByUserId(String userId) async {
    getUserByUserIdLoading(true);
    ApiServices().getMethod(ApiEndpoints.getUserByUserId + userId).then(
      (value) {
        userData(UsersModel.fromJson(value.data));
      },
    ).onError(
      (error, stackTrace) {
        log(error.toString());
      },
    ).whenComplete(
      () => getUserByUserIdLoading(false),
    );
  }

  void goToUserSlideSheet(String userId, BuildContext context) {
    getUserByUserId(userId);
    SideSheet.right(
      width: 400.w,
      body: const UserDetailsSliderSheet(),
      context: context,
    );
  }
}
