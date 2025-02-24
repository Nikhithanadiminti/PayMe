import 'package:get/get.dart';

import '../controllers/water_controller.dart';

class WaterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaterController>(
      () => WaterController(),
    );
  }
}
