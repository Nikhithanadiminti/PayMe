import 'package:get/get.dart';

import '../controllers/debitandcreditcards_controller.dart';

class DebitandcreditcardsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DebitandcreditcardsController>(
      () => DebitandcreditcardsController(),
    );
  }
}
