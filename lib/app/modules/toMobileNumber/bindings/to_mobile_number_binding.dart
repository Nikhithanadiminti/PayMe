import 'package:get/get.dart';

import '../controllers/to_mobile_number_controller.dart';

class ToMobileNumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ToMobileNumberController>(
      () => ToMobileNumberController(),
    );
  }
}
