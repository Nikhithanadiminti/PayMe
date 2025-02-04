import 'package:get/get.dart';

import '../controllers/bikeloan_controller.dart';

class BikeloanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BikeloanController>(
      () => BikeloanController(),
    );
  }
}
