import 'package:get/get.dart';

import '../controllers/purchases_controller.dart';

class PurchasesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PurchasesController>(
      () => PurchasesController(),
    );
  }
}
