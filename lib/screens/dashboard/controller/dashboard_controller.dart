
import 'package:get/get.dart';
import 'package:trakyo_admin/screens/order/order_screen.dart';
import 'package:trakyo_admin/screens/over_view/over_view_screen.dart';
import 'package:trakyo_admin/screens/qr/qr_screen.dart';
import 'package:trakyo_admin/screens/request/request_screen.dart';
import 'package:trakyo_admin/screens/user/user_screen.dart';
import 'package:trakyo_admin/services/local_storage_service.dart';

class DashboardController extends GetxController {
  static DashboardController get to => Get.find();

  RxInt currentIndex = 0.obs;
  List screens = [
    const OverViewScreen(),
    const OrderScreen(),
    const RequestScreen(),
    // const SalesScreen(),
    const QrScreen(),
    const UserScreen(),
  ];

  Future<void> _loadCurrentIndex() async {
    String? storedIndex = await LocalStorage().getString('currentIndex');
    if (storedIndex != null) {
      currentIndex.value = int.parse(storedIndex);
    }
  }

  Future<void> updateCurrentIndex(int index) async {
    currentIndex(index);
    await LocalStorage().setString('currentIndex', index.toString());
  }

  @override
  void onInit() async {
    _loadCurrentIndex();
    super.onInit();
  }
}
