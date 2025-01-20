import 'package:get/get.dart';

import '../controllers/add_upi_number_controller.dart';

class AddUpiNumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddUpiNumberController>(
      () => AddUpiNumberController(),
    );
  }
}
