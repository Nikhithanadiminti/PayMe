import 'package:get/get.dart';

import '../controllers/mobile_recharge_controller.dart';

class MobileRechargeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MobileRechargeController>(
      () => MobileRechargeController(),
    );
  }
}
