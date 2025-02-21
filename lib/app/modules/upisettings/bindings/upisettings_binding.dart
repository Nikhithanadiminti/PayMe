import 'package:get/get.dart';

import '../controllers/upisettings_controller.dart';

class UpisettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpisettingsController>(
      () => UpisettingsController(),
    );
  }
}
