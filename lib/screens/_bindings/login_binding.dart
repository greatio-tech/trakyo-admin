import 'package:get/get.dart';
import 'package:trakyo_admin/screens/login/controller/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
