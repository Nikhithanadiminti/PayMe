import 'package:get/get.dart';

import '../controllers/dth_controller.dart';

class DthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DthController>(
      () => DthController(),
    );
  }
}
