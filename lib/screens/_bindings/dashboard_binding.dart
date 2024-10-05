import 'package:get/get.dart';
import 'package:trakyo_admin/screens/order/controller/order_controller.dart';
import 'package:trakyo_admin/screens/over_view/controller/overview_controller.dart';
import 'package:trakyo_admin/screens/qr/controller/qr_controller.dart';
import 'package:trakyo_admin/screens/request/controller/request_controller.dart';
import 'package:trakyo_admin/screens/user/controller/users_controller.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(OverviewController());
    Get.put(OrderController());
    Get.put(QrController());
    Get.put(UsersController());
    Get.put(RequestController());
    // Get.put(ProductsController());
  }
}
