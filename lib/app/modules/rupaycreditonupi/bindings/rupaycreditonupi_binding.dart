import 'package:get/get.dart';

import '../controllers/rupaycreditonupi_controller.dart';

class RupaycreditonupiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RupaycreditonupiController>(
      () => RupaycreditonupiController(),
    );
  }
}
