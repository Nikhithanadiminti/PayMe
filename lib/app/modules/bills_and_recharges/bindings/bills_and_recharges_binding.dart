import 'package:get/get.dart';

import '../controllers/bills_and_recharges_controller.dart';

class BillsAndRechargesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BillsAndRechargesController>(
      () => BillsAndRechargesController(),
    );
  }
}
