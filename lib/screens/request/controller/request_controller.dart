import 'dart:developer';

import 'package:get/get.dart';
import 'package:trakyo_admin/screens/request/model/request_model.dart';
import 'package:trakyo_admin/services/api_endpoints.dart';
import 'package:trakyo_admin/services/api_service.dart';

class RequestController extends GetxController {
  static RequestController get to => Get.find();

  @override
  void onInit() {
    getRequests();
    super.onInit();
  }

  RxList<RequestModel> requestList = <RequestModel>[].obs;
  RxBool isGetRequestsLoading = false.obs;
  RxBool closeRequestLoading = false.obs;

  Future getRequests() async {
    isGetRequestsLoading(true);
    return ApiServices().getMethod(ApiEndpoints.getRequests).then(
      (value) {
        requestList(requestModelFromJson(value.data));
      },
    ).onError(
      (error, _) {
        log(error.toString());
      },
    ).whenComplete(
      () {
        isGetRequestsLoading(false);
      },
    );
  }

  Future<void> closeRequest(String requestId) async {
    closeRequestLoading(true);
    return ApiServices()
        .putMethod("${ApiEndpoints.closeRequest}/$requestId")
        .then(
      (value) {
        closeRequestLocally(requestId);
      },
    ).onError(
      (error, _) {
        log(error.toString());
      },
    ).whenComplete(
      () {
        closeRequestLoading(false);
      },
    );
  }

  void closeRequestLocally(String requestId) {
    int index = requestList.indexWhere((request) => request.id == requestId);
    if (index != -1) {
      if (requestList[index].status.value == "open") {
        requestList[index].status.value = "closed";
        requestList[index].closedAt = DateTime.now();
      }
      Get.back();
    }
  }
}
