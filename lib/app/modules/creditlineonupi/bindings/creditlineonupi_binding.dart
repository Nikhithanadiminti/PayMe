import 'package:get/get.dart';

import '../controllers/creditlineonupi_controller.dart';

class CreditlineonupiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreditlineonupiController>(
      () => CreditlineonupiController(),
    );
  }
}
