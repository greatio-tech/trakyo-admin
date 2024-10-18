import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trakyo_admin/screens/order/model/order_model.dart';
import 'package:trakyo_admin/services/api_endpoints.dart';
import 'package:trakyo_admin/services/api_exception.dart';
import 'package:trakyo_admin/services/api_service.dart';
import 'package:trakyo_admin/utils/utils.dart';

class OrderController extends GetxController {
  static OrderController get to => Get.find();

  RxList<OrdersModel> orderList = <OrdersModel>[].obs;

  TextEditingController trackingIdController = TextEditingController();

  RxBool getOrderLoading = false.obs;

  @override
  void onInit() {
    getOrder();
    super.onInit();
  }

  Future<DioResponse> updateOrderService(String orderId, String status) async {
    return ApiServices().postMethod(
      ApiEndpoints.updateOrder,
      data: {
        "orderId": orderId,
        "deliveryStatus": status,
        "trackingId": trackingIdController.text,
      },
    );
  }

  Future updateOrder(String orderId, String status) async {
    getOrderLoading(true);
    updateOrderService(orderId, status).then((value) {
      if (value.statusCode == 201 || value.statusCode == 200) {
        log(value.data.toString());
        Utils.showToast("Order updated successfully");
        getOrder();
      } else {
        log(ApiException(value.data['message']).toString());
      }
    }).onError(
      (error, _) {
        log(_.toString());
        Utils.showError(error);
      },
    ).whenComplete(
      () => getOrderLoading(false),
    );
  }

  Future<DioResponse> orderService() async {
    return ApiServices().getMethod(
      ApiEndpoints.order,
    );
  }

  Future getOrder() async {
    getOrderLoading(true);
    orderService().then((value) {
      if (value.statusCode == 201 || value.statusCode == 200) {
        orderList(orderModelFromJson(value.data).toList());
      } else {
        log(ApiException(value.data['message']).toString());
      }
    }).onError(
      (error, _) {
        log(_.toString());
        Utils.showError(error);
      },
    ).whenComplete(
      () => getOrderLoading(false),
    );
  }
}
