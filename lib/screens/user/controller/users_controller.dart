import 'dart:developer';

import 'package:get/get.dart';
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
}
