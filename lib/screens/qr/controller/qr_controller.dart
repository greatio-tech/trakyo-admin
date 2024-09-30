import 'dart:developer';

import 'package:get/get.dart';
import 'package:trakyo_admin/screens/qr/model/qr_model.dart';
import 'package:trakyo_admin/screens/user/controller/users_controller.dart';
import 'package:trakyo_admin/services/api_endpoints.dart';
import 'package:trakyo_admin/services/api_exception.dart';
import 'package:trakyo_admin/services/api_service.dart';
import 'package:trakyo_admin/utils/utils.dart';

class QrController extends GetxController {
  static QrController get to => Get.find();

  RxList<QrModel> qrList = <QrModel>[].obs;

  @override
  void onInit() {
    qrGet();
    super.onInit();
  }

  RxBool getQrLoading = false.obs;

  Future<DioResponse> usersService() async {
    return ApiServices().getMethod(
      ApiEndpoints.qr,
    );
  }

  Future qrGet() async {
    getQrLoading(true);
    usersService().then((value) {
      if (value.statusCode == 201 || value.statusCode == 200) {
        log(value.data.toString());
        qrList(qrModelFromJson(value.data).toList());

        // Get.offAllNamed('/dashboard');
      } else {
        log(ApiException(value.data['message']).toString());
      }
    }).onError(
      (error, _) {
        log(_.toString());
        Utils.showError(error);
      },
    ).whenComplete(
      () => getQrLoading(false),
    );
  }

  String getUserNumberById(String userId) {
    for (var user in UsersController.to.usersList) {
      if (user.id == userId) {
        return user.phoneNumber;
      }
    }
    return '';
  }

  String getUserNameById(String userId) {
    for (var user in UsersController.to.usersList) {
      if (user.id == userId) {
        return user.name;
      }
    }
    return 'Qr Not registered';
  }
}
