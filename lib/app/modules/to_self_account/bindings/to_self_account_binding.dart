import 'package:get/get.dart';

import '../controllers/to_self_account_controller.dart';

class ToSelfAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ToSelfAccountController>(
      () => ToSelfAccountController(),
    );
  }
}
