import 'package:get/get.dart';

import '../controllers/goldloan_controller.dart';

class GoldloanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GoldloanController>(
      () => GoldloanController(),
    );
  }
}
