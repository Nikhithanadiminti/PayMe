import 'package:get/get.dart';

import '../controllers/autopay_controller.dart';

class AutopayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AutopayController>(
      () => AutopayController(),
    );
  }
}
