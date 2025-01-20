import 'package:get/get.dart';

import '../controllers/add_upi_id_controller.dart';

class AddUpiIdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddUpiIdController>(
      () => AddUpiIdController(),
    );
  }
}
