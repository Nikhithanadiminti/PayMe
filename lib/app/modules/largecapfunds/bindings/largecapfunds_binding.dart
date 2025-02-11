import 'package:get/get.dart';

import '../controllers/largecapfunds_controller.dart';

class LargecapfundsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LargecapfundsController>(
      () => LargecapfundsController(),
    );
  }
}
