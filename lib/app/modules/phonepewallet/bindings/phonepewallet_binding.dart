import 'package:get/get.dart';

import '../controllers/phonepewallet_controller.dart';

class PhonepewalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhonepewalletController>(
      () => PhonepewalletController(),
    );
  }
}
