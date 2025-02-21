import 'package:get/get.dart';

import '../controllers/topperforming_controller.dart';

class TopperformingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopperformingController>(
      () => TopperformingController(),
    );
  }
}
