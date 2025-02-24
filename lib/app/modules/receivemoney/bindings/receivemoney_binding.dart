import 'package:get/get.dart';

import '../controllers/receivemoney_controller.dart';

class ReceivemoneyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReceivemoneyController>(
      () => ReceivemoneyController(),
    );
  }
}
