import 'package:get/get.dart';

import '../controllers/fastag_recharge_controller.dart';

class FastagRechargeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FastagRechargeController>(
      () => FastagRechargeController(),
    );
  }
}
