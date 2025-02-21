import 'package:get/get.dart';

import '../controllers/international_controller.dart';

class InternationalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InternationalController>(
      () => InternationalController(),
    );
  }
}
