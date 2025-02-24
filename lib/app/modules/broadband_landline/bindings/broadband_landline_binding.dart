import 'package:get/get.dart';

import '../controllers/broadband_landline_controller.dart';

class BroadbandLandlineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BroadbandLandlineController>(
      () => BroadbandLandlineController(),
    );
  }
}
