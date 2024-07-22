import 'package:get/get.dart';
import 'package:trakyo_admin/screens/over_view/over_view_screen.dart';
import 'package:trakyo_admin/screens/qr/qr_screen.dart';
import 'package:trakyo_admin/screens/request/request_screen.dart';

class DashboradController extends GetxController {
  static DashboradController get to => Get.find();

  RxInt currentIndex = 0.obs;
  List screens = [
    const OverViewScreen(),
    const QrScreen(),
    const RequestScreen()
  ];
}
