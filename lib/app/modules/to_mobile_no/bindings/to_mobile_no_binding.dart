import 'package:get/get.dart';

import '../controllers/to_mobile_no_controller.dart';

class ToMobileNoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ToMobileNoController>(
      () => ToMobileNoController(),
    );
  }
}
