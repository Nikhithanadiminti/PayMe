import 'package:get/get.dart';

import '../controllers/upilite_controller.dart';

class UpiliteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpiliteController>(
      () => UpiliteController(),
    );
  }
}
