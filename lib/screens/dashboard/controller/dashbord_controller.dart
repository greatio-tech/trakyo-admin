import 'package:get/get.dart';

class DashbordController extends GetxController {
  static DashbordController get to => Get.find();
  List buttons = ['New', 'Ongoing', 'Delivered'];
  List ticketBtList = ['New', 'Opened', 'Closed'];
  RxInt currentIndex = 0.obs;
  RxInt ticketCurrentIndex = 0.obs;
}
