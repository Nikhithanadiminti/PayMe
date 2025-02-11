import 'package:get/get.dart';

import '../controllers/bestsipfunds_controller.dart';

class BestsipfundsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BestsipfundsController>(
      () => BestsipfundsController(),
    );
  }
}
