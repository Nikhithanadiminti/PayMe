import 'package:get/get.dart';

import '../controllers/to_bank_upi_id_controller.dart';

class ToBankUpiIdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ToBankUpiIdController>(
      () => ToBankUpiIdController(),
    );
  }
}
