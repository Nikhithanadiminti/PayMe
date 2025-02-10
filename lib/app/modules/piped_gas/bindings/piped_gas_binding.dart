import 'package:get/get.dart';

import '../controllers/piped_gas_controller.dart';

class PipedGasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PipedGasController>(
      () => PipedGasController(),
    );
  }
}
