import 'package:get/get.dart';

import '../controllers/creditscore_controller.dart';

class CreditscoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreditscoreController>(
      () => CreditscoreController(),
    );
  }
}
