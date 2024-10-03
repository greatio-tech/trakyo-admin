import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trakyo_admin/screens/user/model/users_model.dart';
import 'package:trakyo_admin/services/api_endpoints.dart';
import 'package:trakyo_admin/services/api_exception.dart';
import 'package:trakyo_admin/services/api_service.dart';
import 'package:trakyo_admin/utils/utils.dart';
import 'package:intl/intl.dart';

class UsersController extends GetxController {
  static UsersController get to => Get.find();

  @override
  void onInit() {
    userGet();
    super.onInit();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  RxList<QrCode> qrList = <QrCode>[].obs;
  RxList<Vehicle> vehicleList = <Vehicle>[].obs;

  RxList<UsersModel> usersList = <UsersModel>[].obs;

  RxBool getUsersLoading = false.obs;

  setUserData(index) {
    nameController.text = usersList[index].name;
    numberController.text = usersList[index].phoneNumber;
    mailController.text = usersList[index].email;
    String formattedDob = DateFormat('dd/MM/yyyy').format(usersList[index].dob);
    dobController.text = formattedDob;
    qrList(usersList[index].qrCodes);
    vehicleList(usersList[index].vehicles);
  }

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
}
