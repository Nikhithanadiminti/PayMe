import 'package:get/get.dart';

import '../controllers/phonepegiftcard_controller.dart';

class PhonepegiftcardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhonepegiftcardController>(
      () => PhonepegiftcardController(),
    );
  }
}
