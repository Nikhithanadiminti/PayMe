import 'package:get/get.dart';

import '../controllers/startwith_controller.dart';

class StartwithBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StartwithController>(
      () => StartwithController(),
    );
  }
}
