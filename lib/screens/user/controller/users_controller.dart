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
import 'package:trakyo_admin/utils/common_functions.dart';
import 'package:trakyo_admin/utils/utils.dart';

class UsersController extends GetxController {
  static UsersController get to => Get.find();

  @override
  void onInit() {
    userGet();
    super.onInit();
  }

  RxList<UsersModel> usersList = <UsersModel>[].obs;

  RxBool isUserNameEditable = false.obs;
  RxBool userNameEditLoading = false.obs;
  RxBool userEmailEditLoading = false.obs;
  RxBool isEmailEditable = false.obs;
  RxBool isDobEditable = false.obs;
  RxBool userDOBLoading = false.obs;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

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

  Future getUserByUserId(String userId, {bool? restrictLoading = false}) async {
    if (restrictLoading == false) getUserByUserIdLoading(true);
    ApiServices().getMethod(ApiEndpoints.getUserByUserId + userId).then(
      (value) {
        userData(UsersModel.fromJson(value.data));
        fullNameController.text = userData.value!.name;
        emailController.text = userData.value!.email;
        if (restrictLoading == true) {
          updateUserFromApiResp(value.data);
        }
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
    isDobEditable(false);
    isEmailEditable(false);
    isUserNameEditable(false);
    SideSheet.right(
      width: 400.w,
      body: const UserDetailsSliderSheet(),
      context: context,
    );
  }

  String? vehicleNameById(String vehicleId) {
    for (var user in usersList) {
      for (var vehicle in user.vehicles) {
        if (vehicle.id == vehicleId) {
          return '${vehicle.make} ${vehicle.model}';
        }
      }
    }
    return null;
  }

  Future<void> editUserName() async {
    if (fullNameController.text.trim().isEmpty) {
      Utils.showError("Full name cannot be empty");
      return;
    }
    userNameEditLoading(true);
    await editUserInfo(
            userId: userData.value!.id, name: fullNameController.text.trim())
        .then(
      (value) {
        Utils.showSuccess("User name updated successfully");
        isUserNameEditable(false);
      },
    ).onError((error, stackTrace) {
      log(error.toString());
    }).whenComplete(
      () => userNameEditLoading(false),
    );
  }

  Future<void> editEmail() async {
    if (emailController.text.isEmpty) {
      Utils.showError("Email cannot be empty");
      return;
    }
    if (!emailController.text.isEmail) {
      Utils.showError("Email is not valid");
      return;
    }
    userEmailEditLoading(true);
    await editUserInfo(
            userId: userData.value!.id, email: emailController.text.trim())
        .then(
      (value) {
        Utils.showSuccess("Email updated successfully");
        isEmailEditable(false);
      },
    ).onError((error, stackTrace) {
      log(error.toString());
    }).whenComplete(
      () => userEmailEditLoading(false),
    );
  }

  Future<void> editDOB(
    DateTime dob,
  ) async {
    userDOBLoading(true);
    await editUserInfo(userId: userData.value!.id, dob: dob).then(
      (value) {
        Utils.showSuccess("DOB updated successfully");
        isDobEditable(false);
      },
    ).onError((error, stackTrace) {
      log(error.toString());
    }).whenComplete(
      () => userDOBLoading(false),
    );
  }

  Future<void> editUserInfo(
      {required String userId,
      String? name,
      String? email,
      DateTime? dob}) async {
    await ApiServices().putMethod(
      "${ApiEndpoints.editUser}/$userId",
      data: {
        "name": name ?? userData.value!.name,
        "email": email ?? userData.value!.email,
        "dob": dob != null ? dob.toString() : userData.value!.dob.toString(),
      },
    ).then(
      (value) {
        getUserByUserId(userData.value!.id, restrictLoading: true);
      },
    );
  }

  void updateUserFromApiResp(Map<String, dynamic> apiResponse) {
    UsersModel updatedUser = UsersModel.fromJson(apiResponse);

    updateUserInLocalList(updatedUser);
  }

  void updateUserInLocalList(UsersModel updatedUser) {
    int index = usersList.indexWhere((user) => user.id == updatedUser.id);

    if (index != -1) {
      usersList[index] = updatedUser;
    }
  }

  void sendMail({required String email}) {
    String subject = "Trakyo message";
    String body = "This message is sent from Trakyo admin panel";

    CommonFunctions.launchUrl(
        'https://mail.google.com/mail/?view=cm&fs=1&to=$email&su=$subject&body=$body');
  }
}
